// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Bytes } from "./Bytes.sol";
import { Storage } from "./Storage.sol";
import { Memory } from "./Memory.sol";
import { FieldLayout, FieldLayoutLib } from "./FieldLayout.sol";
import { Schema, SchemaLib } from "./Schema.sol";
import { PackedCounter } from "./PackedCounter.sol";
import { Slice, SliceLib } from "./Slice.sol";
import { Hooks, Tables, HooksTableId } from "./codegen/Tables.sol";
import { IStoreErrors } from "./IStoreErrors.sol";
import { IStoreHook } from "./IStore.sol";
import { StoreSwitch } from "./StoreSwitch.sol";

library StoreCore {
  // note: the preimage of the tuple of keys used to index is part of the event, so it can be used by indexers
  event StoreSetRecord(bytes32 table, bytes32[] key, bytes data);
  event StoreSetField(bytes32 table, bytes32[] key, uint8 fieldIndex, bytes data);
  event StoreDeleteRecord(bytes32 table, bytes32[] key);
  event StoreEphemeralRecord(bytes32 table, bytes32[] key, bytes data);

  /**
   * Initialize internal tables.
   * Consumers must call this function in their constructor.
   * TODO: should we turn the FieldLayout table into a "proper table" and register it here?
   * (see https://github.com/latticexyz/mud/issues/444)
   */
  function initialize() internal {
    // StoreSwitch uses the storeAddress to decide where to write data to.
    // If StoreSwitch is called in the context of a Store contract (storeAddress == address(this)),
    // StoreSwitch uses internal methods to write data instead of external calls.
    StoreSwitch.setStoreAddress(address(this));

    // Register internal tables
    Tables.register();
    Hooks.register();
  }

  /************************************************************************
   *
   *    SCHEMA
   *
   ************************************************************************/

  /**
   * Get the field layout for the given tableId
   */
  function getFieldLayout(bytes32 tableId) internal view returns (FieldLayout fieldLayout) {
    fieldLayout = FieldLayout.wrap(Tables.getFieldLayout(tableId));
    if (fieldLayout.isEmpty()) {
      revert IStoreErrors.StoreCore_TableNotFound(tableId, string(abi.encodePacked(tableId)));
    }
  }

  /**
   * Get the key schema for the given tableId
   */
  function getKeySchema(bytes32 tableId) internal view returns (Schema keySchema) {
    keySchema = Schema.wrap(Tables.getKeySchema(tableId));
    // key schemas can be empty for singleton tables, so we can't depend on key schema for table check
    if (!hasTable(tableId)) {
      revert IStoreErrors.StoreCore_TableNotFound(tableId, string(abi.encodePacked(tableId)));
    }
  }

  /**
   * Get the schema for the given tableId
   */
  function getValueSchema(bytes32 tableId) internal view returns (Schema valueSchema) {
    valueSchema = Schema.wrap(Tables.getValueSchema(tableId));
    if (valueSchema.isEmpty()) {
      revert IStoreErrors.StoreCore_TableNotFound(tableId, string(abi.encodePacked(tableId)));
    }
  }

  /**
   * Check if a table with the given tableId exists
   */
  function hasTable(bytes32 tableId) internal view returns (bool) {
    return Tables.getFieldLayout(tableId) != bytes32(0);
  }

  /**
   * Register a new table with key field layout, value field layout, key names, and value names
   */
  function registerTable(
    bytes32 tableId,
    FieldLayout fieldLayout,
    Schema keySchema,
    Schema valueSchema,
    string[] memory keyNames,
    string[] memory valueNames
  ) internal {
    // Verify the field layout is valid
    fieldLayout.validate({ allowEmpty: false });
    // Verify the schema is valid
    keySchema.validate({ allowEmpty: true });
    valueSchema.validate({ allowEmpty: false });

    // Verify the number of key names matches the number of key schema types
    if (keyNames.length != keySchema.numFields()) {
      revert IStoreErrors.StoreCore_InvalidKeyNamesLength(keySchema.numFields(), keyNames.length);
    }

    // Verify the number of value names
    if (valueNames.length != fieldLayout.numFields()) {
      revert IStoreErrors.StoreCore_InvalidValueNamesLength(fieldLayout.numFields(), valueNames.length);
    }
    // Verify the number of value schema types
    if (valueSchema.numFields() != fieldLayout.numFields()) {
      revert IStoreErrors.StoreCore_InvalidValueSchemaLength(fieldLayout.numFields(), valueSchema.numFields());
    }

    // Verify the field layout doesn't exist yet
    if (hasTable(tableId)) {
      revert IStoreErrors.StoreCore_TableAlreadyExists(tableId, string(abi.encodePacked(tableId)));
    }

    // Register the table metadata
    Tables.set(
      tableId,
      FieldLayout.unwrap(fieldLayout),
      Schema.unwrap(keySchema),
      Schema.unwrap(valueSchema),
      abi.encode(keyNames),
      abi.encode(valueNames)
    );
  }

  /************************************************************************
   *
   *    REGISTER HOOKS
   *
   ************************************************************************/

  /*
   * Register hooks to be called when a record or field is set or deleted
   */
  function registerStoreHook(bytes32 tableId, IStoreHook hook) internal {
    Hooks.push(tableId, address(hook));
  }

  /************************************************************************
   *
   *    SET DATA
   *
   ************************************************************************/

  /**
   * Set full data record for the given tableId and key tuple and field layout
   */
  function setRecord(bytes32 tableId, bytes32[] memory key, bytes memory data, FieldLayout fieldLayout) internal {
    // verify the value has the correct length for the tableId (based on the tableId's field layout)
    // to prevent invalid data from being stored

    // Verify static data length + dynamic data length matches the given data
    (uint256 staticLength, PackedCounter dynamicLength) = StoreCoreInternal._validateDataLength(fieldLayout, data);

    // Emit event to notify indexers
    emit StoreSetRecord(tableId, key, data);

    // Call onSetRecord hooks (before actually modifying the state, so observers have access to the previous state if needed)
    address[] memory hooks = Hooks.get(tableId);
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onSetRecord(tableId, key, data, fieldLayout);
    }

    // Store the static data at the static data location
    uint256 staticDataLocation = StoreCoreInternal._getStaticDataLocation(tableId, key);
    uint256 memoryPointer = Memory.dataPointer(data);
    Storage.store({
      storagePointer: staticDataLocation,
      offset: 0,
      memoryPointer: memoryPointer,
      length: staticLength
    });
    memoryPointer += staticLength + 32; // move the memory pointer to the start of the dynamic data (skip the encoded dynamic length)

    // If there is no dynamic data, we're done
    if (fieldLayout.numDynamicFields() == 0) return;

    // Store the dynamic data length at the dynamic data length location
    uint256 dynamicDataLengthLocation = StoreCoreInternal._getDynamicDataLengthLocation(tableId, key);
    Storage.store({ storagePointer: dynamicDataLengthLocation, data: dynamicLength.unwrap() });

    // For every dynamic element, slice off the dynamic data and store it at the dynamic location
    uint256 dynamicDataLocation;
    uint256 dynamicDataLength;
    for (uint8 i; i < fieldLayout.numDynamicFields(); ) {
      dynamicDataLocation = StoreCoreInternal._getDynamicDataLocation(tableId, key, i);
      dynamicDataLength = dynamicLength.atIndex(i);
      Storage.store({
        storagePointer: dynamicDataLocation,
        offset: 0,
        memoryPointer: memoryPointer,
        length: dynamicDataLength
      });
      memoryPointer += dynamicDataLength; // move the memory pointer to the start of the next dynamic data
      unchecked {
        i++;
      }
    }
  }

  /**
   * Set data for a field in a table with the given tableId, key tuple and value field layout
   */
  function setField(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    bytes memory data,
    FieldLayout fieldLayout
  ) internal {
    // Emit event to notify indexers
    emit StoreSetField(tableId, key, schemaIndex, data);

    // Call onBeforeSetField hooks (before modifying the state)
    address[] memory hooks = Hooks.get(tableId);

    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onBeforeSetField(tableId, key, schemaIndex, data, fieldLayout);
    }

    if (schemaIndex < fieldLayout.numStaticFields()) {
      StoreCoreInternal._setStaticField(tableId, key, fieldLayout, schemaIndex, data);
    } else {
      StoreCoreInternal._setDynamicField(tableId, key, fieldLayout, schemaIndex, data);
    }

    // Call onAfterSetField hooks (after modifying the state)
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onAfterSetField(tableId, key, schemaIndex, data, fieldLayout);
    }
  }

  /**
   * Delete a record for the given tableId, key tuple and value field layout
   */
  function deleteRecord(bytes32 tableId, bytes32[] memory key, FieldLayout fieldLayout) internal {
    // Emit event to notify indexers
    emit StoreDeleteRecord(tableId, key);

    // Call onDeleteRecord hooks (before actually modifying the state, so observers have access to the previous state if needed)
    address[] memory hooks = Hooks.get(tableId);
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onDeleteRecord(tableId, key, fieldLayout);
    }

    // Delete static data
    uint256 staticDataLocation = StoreCoreInternal._getStaticDataLocation(tableId, key);
    Storage.store({ storagePointer: staticDataLocation, offset: 0, data: new bytes(fieldLayout.staticDataLength()) });

    // If there are no dynamic fields, we're done
    if (fieldLayout.numDynamicFields() == 0) return;

    // Delete dynamic data length
    uint256 dynamicDataLengthLocation = StoreCoreInternal._getDynamicDataLengthLocation(tableId, key);
    Storage.store({ storagePointer: dynamicDataLengthLocation, data: bytes32(0) });
  }

  /**
   * Push data to a field in a table with the given tableId, key tuple and value field layout
   */
  function pushToField(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    bytes memory dataToPush,
    FieldLayout fieldLayout
  ) internal {
    if (schemaIndex < fieldLayout.numStaticFields()) {
      revert IStoreErrors.StoreCore_NotDynamicField();
    }

    // TODO add push-specific event and hook to avoid the storage read? (https://github.com/latticexyz/mud/issues/444)
    bytes memory fullData = abi.encodePacked(
      StoreCoreInternal._getDynamicField(tableId, key, schemaIndex, fieldLayout),
      dataToPush
    );

    // Emit event to notify indexers
    emit StoreSetField(tableId, key, schemaIndex, fullData);

    // Call onBeforeSetField hooks (before modifying the state)
    address[] memory hooks = Hooks.get(tableId);
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onBeforeSetField(tableId, key, schemaIndex, fullData, fieldLayout);
    }

    StoreCoreInternal._pushToDynamicField(tableId, key, fieldLayout, schemaIndex, dataToPush);

    // Call onAfterSetField hooks (after modifying the state)
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onAfterSetField(tableId, key, schemaIndex, fullData, fieldLayout);
    }
  }

  /**
   * Pop data from a field in a table with the given tableId, key tuple and value field layout
   */
  function popFromField(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    uint256 byteLengthToPop,
    FieldLayout fieldLayout
  ) internal {
    if (schemaIndex < fieldLayout.numStaticFields()) {
      revert IStoreErrors.StoreCore_NotDynamicField();
    }

    // TODO add pop-specific event and hook to avoid the storage read? (https://github.com/latticexyz/mud/issues/444)
    bytes memory fullData;
    {
      bytes memory oldData = StoreCoreInternal._getDynamicField(tableId, key, schemaIndex, fieldLayout);
      fullData = SliceLib.getSubslice(oldData, 0, oldData.length - byteLengthToPop).toBytes();
    }

    // Emit event to notify indexers
    emit StoreSetField(tableId, key, schemaIndex, fullData);

    // Call onBeforeSetField hooks (before modifying the state)
    address[] memory hooks = Hooks.get(tableId);
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onBeforeSetField(tableId, key, schemaIndex, fullData, fieldLayout);
    }

    StoreCoreInternal._popFromDynamicField(tableId, key, fieldLayout, schemaIndex, byteLengthToPop);

    // Call onAfterSetField hooks (after modifying the state)
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onAfterSetField(tableId, key, schemaIndex, fullData, fieldLayout);
    }
  }

  /**
   * Update data in a field in a table with the given tableId, key tuple and value field layout
   */
  function updateInField(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    uint256 startByteIndex,
    bytes memory dataToSet,
    FieldLayout fieldLayout
  ) internal {
    if (schemaIndex < fieldLayout.numStaticFields()) {
      revert IStoreErrors.StoreCore_NotDynamicField();
    }
    // index must be checked because it could be arbitrarily large
    // (but dataToSet.length can be unchecked - it won't overflow into another slot due to gas costs and hashed slots)
    if (startByteIndex > type(uint40).max) {
      revert IStoreErrors.StoreCore_DataIndexOverflow(type(uint40).max, startByteIndex);
    }

    // TODO add setItem-specific event and hook to avoid the storage read? (https://github.com/latticexyz/mud/issues/444)
    bytes memory fullData;
    {
      bytes memory oldData = StoreCoreInternal._getDynamicField(tableId, key, schemaIndex, fieldLayout);
      fullData = abi.encodePacked(
        SliceLib.getSubslice(oldData, 0, startByteIndex).toBytes(),
        dataToSet,
        SliceLib.getSubslice(oldData, startByteIndex + dataToSet.length, oldData.length).toBytes()
      );
    }

    // Emit event to notify indexers
    emit StoreSetField(tableId, key, schemaIndex, fullData);

    // Call onBeforeSetField hooks (before modifying the state)
    address[] memory hooks = Hooks.get(tableId);
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onBeforeSetField(tableId, key, schemaIndex, fullData, fieldLayout);
    }

    StoreCoreInternal._setDynamicFieldItem(tableId, key, fieldLayout, schemaIndex, startByteIndex, dataToSet);

    // Call onAfterSetField hooks (after modifying the state)
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onAfterSetField(tableId, key, schemaIndex, fullData, fieldLayout);
    }
  }

  /************************************************************************
   *
   *    EPHEMERAL SET DATA
   *
   ************************************************************************/

  /**
   * Emit the ephemeral event without modifying storage for the full data of the given tableId and key tuple
   */
  function emitEphemeralRecord(
    bytes32 tableId,
    bytes32[] memory key,
    bytes memory data,
    FieldLayout fieldLayout
  ) internal {
    // Verify static data length + dynamic data length matches the given data
    StoreCoreInternal._validateDataLength(fieldLayout, data);

    // Emit event to notify indexers
    emit StoreEphemeralRecord(tableId, key, data);

    // Call onSetRecord hooks
    address[] memory hooks = Hooks.get(tableId);
    for (uint256 i; i < hooks.length; i++) {
      IStoreHook hook = IStoreHook(hooks[i]);
      hook.onSetRecord(tableId, key, data, fieldLayout);
    }
  }

  /************************************************************************
   *
   *    GET DATA
   *
   ************************************************************************/

  /**
   * Get full record (all fields, static and dynamic data) for the given tableId and key tuple, with the given value field layout
   */
  function getRecord(
    bytes32 tableId,
    bytes32[] memory key,
    FieldLayout fieldLayout
  ) internal view returns (bytes memory) {
    // Get the static data length
    uint256 staticLength = fieldLayout.staticDataLength();
    uint256 outputLength = staticLength;

    // Load the dynamic data length if there are dynamic fields
    PackedCounter dynamicDataLength;
    uint256 numDynamicFields = fieldLayout.numDynamicFields();
    if (numDynamicFields > 0) {
      dynamicDataLength = StoreCoreInternal._loadEncodedDynamicDataLength(tableId, key);
      // TODO should total output include dynamic data length even if it's 0?
      if (dynamicDataLength.total() > 0) {
        outputLength += 32 + dynamicDataLength.total(); // encoded length + data
      }
    }

    // Allocate length for the full packed data (static and dynamic)
    bytes memory data = new bytes(outputLength);
    uint256 memoryPointer = Memory.dataPointer(data);

    // Load the static data from storage
    StoreCoreInternal._getStaticData(tableId, key, staticLength, memoryPointer);

    // Early return if there are no dynamic fields
    if (dynamicDataLength.total() == 0) return data;
    // Advance memoryPointer to the dynamic data section
    memoryPointer += staticLength;

    // Append the encoded dynamic length
    assembly {
      mstore(memoryPointer, dynamicDataLength)
    }
    // Advance memoryPointer by the length of `dynamicDataLength` (1 word)
    memoryPointer += 0x20;

    // Append dynamic data
    for (uint8 i; i < numDynamicFields; i++) {
      uint256 dynamicDataLocation = StoreCoreInternal._getDynamicDataLocation(tableId, key, i);
      uint256 length = dynamicDataLength.atIndex(i);
      Storage.load({ storagePointer: dynamicDataLocation, length: length, offset: 0, memoryPointer: memoryPointer });
      // Advance memoryPointer by the length of this dynamic field
      memoryPointer += length;
    }

    // Return the packed data
    return data;
  }

  /**
   * Get a single field from the given tableId and key tuple, with the given value field layout
   */
  function getField(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    FieldLayout fieldLayout
  ) internal view returns (bytes memory) {
    if (schemaIndex < fieldLayout.numStaticFields()) {
      return StoreCoreInternal._getStaticField(tableId, key, schemaIndex, fieldLayout);
    } else {
      return StoreCoreInternal._getDynamicField(tableId, key, schemaIndex, fieldLayout);
    }
  }

  /**
   * Get the byte length of a single field from the given tableId and key tuple, with the given value field layout
   */
  function getFieldLength(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    FieldLayout fieldLayout
  ) internal view returns (uint256) {
    uint8 numStaticFields = uint8(fieldLayout.numStaticFields());
    if (schemaIndex < numStaticFields) {
      return fieldLayout.atIndex(schemaIndex);
    } else {
      // Get the length and storage location of the dynamic field
      uint8 dynamicFieldLayoutIndex = schemaIndex - numStaticFields;
      return StoreCoreInternal._loadEncodedDynamicDataLength(tableId, key).atIndex(dynamicFieldLayoutIndex);
    }
  }

  /**
   * Get a byte slice (including start, excluding end) of a single dynamic field from the given tableId and key tuple, with the given value field layout.
   * The slice is unchecked and will return invalid data if `start`:`end` overflow.
   */
  function getFieldSlice(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    FieldLayout fieldLayout,
    uint256 start,
    uint256 end
  ) internal view returns (bytes memory) {
    uint8 numStaticFields = uint8(fieldLayout.numStaticFields());
    if (schemaIndex < fieldLayout.numStaticFields()) {
      revert IStoreErrors.StoreCore_NotDynamicField();
    }

    // Get the length and storage location of the dynamic field
    uint8 dynamicSchemaIndex = schemaIndex - numStaticFields;
    uint256 location = StoreCoreInternal._getDynamicDataLocation(tableId, key, dynamicSchemaIndex);

    return Storage.load({ storagePointer: location, length: end - start, offset: start });
  }
}

library StoreCoreInternal {
  bytes32 internal constant SLOT = keccak256("mud.store");

  /************************************************************************
   *
   *    SET DATA
   *
   ************************************************************************/

  function _setStaticField(
    bytes32 tableId,
    bytes32[] memory key,
    FieldLayout fieldLayout,
    uint8 schemaIndex,
    bytes memory data
  ) internal {
    // verify the value has the correct length for the field
    uint256 staticByteLength = fieldLayout.atIndex(schemaIndex);
    if (staticByteLength != data.length) {
      revert IStoreErrors.StoreCore_InvalidDataLength(staticByteLength, data.length);
    }

    // Store the provided value in storage
    uint256 location = _getStaticDataLocation(tableId, key);
    uint256 offset = _getStaticDataOffset(fieldLayout, schemaIndex);
    Storage.store({ storagePointer: location, offset: offset, data: data });
  }

  function _setDynamicField(
    bytes32 tableId,
    bytes32[] memory key,
    FieldLayout fieldLayout,
    uint8 schemaIndex,
    bytes memory data
  ) internal {
    uint8 dynamicSchemaIndex = schemaIndex - uint8(fieldLayout.numStaticFields());

    // Update the dynamic data length
    _setDynamicDataLengthAtIndex(tableId, key, dynamicSchemaIndex, data.length);

    // Store the provided value in storage
    uint256 dynamicDataLocation = _getDynamicDataLocation(tableId, key, dynamicSchemaIndex);
    Storage.store({ storagePointer: dynamicDataLocation, offset: 0, data: data });
  }

  function _pushToDynamicField(
    bytes32 tableId,
    bytes32[] memory key,
    FieldLayout fieldLayout,
    uint8 schemaIndex,
    bytes memory dataToPush
  ) internal {
    uint8 dynamicSchemaIndex = schemaIndex - uint8(fieldLayout.numStaticFields());

    // Load dynamic data length from storage
    uint256 dynamicDataLengthSlot = _getDynamicDataLengthLocation(tableId, key);
    PackedCounter encodedLengths = PackedCounter.wrap(Storage.load({ storagePointer: dynamicDataLengthSlot }));

    // Update the encoded length
    uint256 oldFieldLength = encodedLengths.atIndex(dynamicSchemaIndex);
    encodedLengths = encodedLengths.setAtIndex(dynamicSchemaIndex, oldFieldLength + dataToPush.length);

    // Set the new length
    Storage.store({ storagePointer: dynamicDataLengthSlot, data: encodedLengths.unwrap() });

    // Append `dataToPush` to the end of the data in storage
    _setPartialDynamicData(tableId, key, dynamicSchemaIndex, oldFieldLength, dataToPush);
  }

  function _popFromDynamicField(
    bytes32 tableId,
    bytes32[] memory key,
    FieldLayout fieldLayout,
    uint8 schemaIndex,
    uint256 byteLengthToPop
  ) internal {
    uint8 dynamicSchemaIndex = schemaIndex - uint8(fieldLayout.numStaticFields());

    // Load dynamic data length from storage
    uint256 dynamicDataLengthSlot = _getDynamicDataLengthLocation(tableId, key);
    PackedCounter encodedLengths = PackedCounter.wrap(Storage.load({ storagePointer: dynamicDataLengthSlot }));

    // Update the encoded length
    uint256 oldFieldLength = encodedLengths.atIndex(dynamicSchemaIndex);
    encodedLengths = encodedLengths.setAtIndex(dynamicSchemaIndex, oldFieldLength - byteLengthToPop);

    // Set the new length
    Storage.store({ storagePointer: dynamicDataLengthSlot, data: encodedLengths.unwrap() });

    // Data can be left unchanged, push/set do not assume storage to be 0s
  }

  // startOffset is measured in bytes
  function _setDynamicFieldItem(
    bytes32 tableId,
    bytes32[] memory key,
    FieldLayout fieldLayout,
    uint8 schemaIndex,
    uint256 startByteIndex,
    bytes memory dataToSet
  ) internal {
    uint8 dynamicSchemaIndex = schemaIndex - uint8(fieldLayout.numStaticFields());

    // Set `dataToSet` at the given index
    _setPartialDynamicData(tableId, key, dynamicSchemaIndex, startByteIndex, dataToSet);
  }

  /************************************************************************
   *
   *    GET DATA
   *
   ************************************************************************/

  /**
   * Get full static data for the given tableId and key tuple, with the given static length
   */
  function _getStaticData(bytes32 tableId, bytes32[] memory key, uint256 length, uint256 memoryPointer) internal view {
    if (length == 0) return;

    // Load the data from storage
    uint256 location = _getStaticDataLocation(tableId, key);
    Storage.load({ storagePointer: location, length: length, offset: 0, memoryPointer: memoryPointer });
  }

  /**
   * Get a single static field from the given tableId and key tuple, with the given value field layout
   */
  function _getStaticField(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    FieldLayout fieldLayout
  ) internal view returns (bytes memory) {
    // Get the length, storage location and offset of the static field
    uint256 staticByteLength = fieldLayout.atIndex(schemaIndex);
    uint256 location = _getStaticDataLocation(tableId, key);
    uint256 offset = _getStaticDataOffset(fieldLayout, schemaIndex);

    // Load the data from storage

    return Storage.load({ storagePointer: location, length: staticByteLength, offset: offset });
  }

  /**
   * Get a single dynamic field from the given tableId and key tuple, with the given value field layout
   */
  function _getDynamicField(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex,
    FieldLayout fieldLayout
  ) internal view returns (bytes memory) {
    // Get the length and storage location of the dynamic field
    uint8 dynamicSchemaIndex = schemaIndex - uint8(fieldLayout.numStaticFields());
    uint256 location = _getDynamicDataLocation(tableId, key, dynamicSchemaIndex);
    uint256 dataLength = _loadEncodedDynamicDataLength(tableId, key).atIndex(dynamicSchemaIndex);

    return Storage.load({ storagePointer: location, length: dataLength, offset: 0 });
  }

  /************************************************************************
   *
   *    HELPER FUNCTIONS
   *
   ************************************************************************/

  /**
   * Verify static data length + dynamic data length matches the given data
   * Returns the static and dynamic lengths
   */
  function _validateDataLength(
    FieldLayout fieldLayout,
    bytes memory data
  ) internal pure returns (uint256 staticLength, PackedCounter dynamicLength) {
    staticLength = fieldLayout.staticDataLength();
    uint256 expectedLength = staticLength;
    dynamicLength;
    if (fieldLayout.numDynamicFields() > 0) {
      // Dynamic length is encoded at the start of the dynamic length blob
      dynamicLength = PackedCounter.wrap(Bytes.slice32(data, staticLength));
      expectedLength += 32 + dynamicLength.total(); // encoded length + data
    }

    if (expectedLength != data.length) {
      revert IStoreErrors.StoreCore_InvalidDataLength(expectedLength, data.length);
    }
  }

  /////////////////////////////////////////////////////////////////////////
  //    STATIC DATA
  /////////////////////////////////////////////////////////////////////////

  /**
   * Compute the storage location based on tableId id and index tuple
   */
  function _getStaticDataLocation(bytes32 tableId, bytes32[] memory key) internal pure returns (uint256) {
    return uint256(keccak256(abi.encode(SLOT, tableId, key)));
  }

  /**
   * Get storage offset for the given value field layout and (static length) index
   */
  function _getStaticDataOffset(FieldLayout fieldLayout, uint8 schemaIndex) internal pure returns (uint256) {
    uint256 offset = 0;
    for (uint256 i; i < schemaIndex; i++) {
      offset += fieldLayout.atIndex(i);
    }
    return offset;
  }

  /////////////////////////////////////////////////////////////////////////
  //    DYNAMIC DATA
  /////////////////////////////////////////////////////////////////////////

  /**
   * Compute the storage location based on tableId id and index tuple
   */
  function _getDynamicDataLocation(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 schemaIndex
  ) internal pure returns (uint256) {
    return uint256(keccak256(abi.encode(SLOT, tableId, key, schemaIndex)));
  }

  /**
   * Compute the storage location for the length of the dynamic data
   */
  function _getDynamicDataLengthLocation(bytes32 tableId, bytes32[] memory key) internal pure returns (uint256) {
    return uint256(keccak256(abi.encode(SLOT, tableId, key, "length")));
  }

  /**
   * Get the length of the dynamic data for the given value field layout and index
   */
  function _loadEncodedDynamicDataLength(bytes32 tableId, bytes32[] memory key) internal view returns (PackedCounter) {
    // Load dynamic data length from storage
    uint256 dynamicDataLengthSlot = _getDynamicDataLengthLocation(tableId, key);
    return PackedCounter.wrap(Storage.load({ storagePointer: dynamicDataLengthSlot }));
  }

  /**
   * Set the length of the dynamic data (in bytes) for the given value field layout and index
   */
  function _setDynamicDataLengthAtIndex(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 dynamicSchemaIndex, // schemaIndex - numStaticFields
    uint256 newLengthAtIndex
  ) internal {
    // Load dynamic data length from storage
    uint256 dynamicDataLengthSlot = _getDynamicDataLengthLocation(tableId, key);
    PackedCounter encodedLengths = PackedCounter.wrap(Storage.load({ storagePointer: dynamicDataLengthSlot }));

    // Update the encoded lengths
    encodedLengths = encodedLengths.setAtIndex(dynamicSchemaIndex, newLengthAtIndex);

    // Set the new lengths
    Storage.store({ storagePointer: dynamicDataLengthSlot, data: encodedLengths.unwrap() });
  }

  /**
   * Modify a part of the dynamic field's data (without changing the field's length)
   */
  function _setPartialDynamicData(
    bytes32 tableId,
    bytes32[] memory key,
    uint8 dynamicSchemaIndex,
    uint256 startByteIndex,
    bytes memory partialData
  ) internal {
    uint256 dynamicDataLocation = _getDynamicDataLocation(tableId, key, dynamicSchemaIndex);
    // start index is in bytes, whereas storage slots are in 32-byte words
    dynamicDataLocation += startByteIndex / 32;
    // partial storage slot offset (there is no inherent offset, as each dynamic field starts at its own storage slot)
    uint256 offset = startByteIndex % 32;
    Storage.store({ storagePointer: dynamicDataLocation, offset: offset, data: partialData });
  }
}
