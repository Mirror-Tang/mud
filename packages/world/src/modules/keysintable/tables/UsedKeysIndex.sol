// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("UsedKeysIndex")));
bytes32 constant UsedKeysIndexTableId = _tableId;

library UsedKeysIndex {
  /** Get the table keys' field layout */
  function getKeyFieldLayout() internal pure returns (FieldLayout) {
    uint256[] memory _fieldLayout = new uint256[](2);
    _fieldLayout[0] = 32;
    _fieldLayout[1] = 32;

    return FieldLayoutLib.encode(_fieldLayout, 0);
  }

  /** Get the table values' field layout */
  function getValueFieldLayout() internal pure returns (FieldLayout) {
    uint256[] memory _fieldLayout = new uint256[](2);
    _fieldLayout[0] = 1;
    _fieldLayout[1] = 5;

    return FieldLayoutLib.encode(_fieldLayout, 0);
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BOOL;
    _schema[1] = SchemaType.UINT40;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "sourceTable";
    keyNames[1] = "keysHash";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "has";
    fieldNames[1] = "index";
  }

  /** Register the table keys' and values' field layout, key names and value names */
  function register() internal {
    StoreSwitch.registerTable(
      _tableId,
      getKeyFieldLayout(),
      getValueFieldLayout(),
      getKeySchema(),
      getValueSchema(),
      getKeyNames(),
      getFieldNames()
    );
  }

  /** Register the table keys' and values' field layout, key names and value names (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(
      _tableId,
      getKeyFieldLayout(),
      getValueFieldLayout(),
      getKeySchema(),
      getValueSchema(),
      getKeyNames(),
      getFieldNames()
    );
  }

  /** Get has */
  function getHas(bytes32 sourceTable, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getValueFieldLayout());
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get has (using the specified store) */
  function getHas(IStore _store, bytes32 sourceTable, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getValueFieldLayout());
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set has */
  function setHas(bytes32 sourceTable, bytes32 keysHash, bool has) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((has)), getValueFieldLayout());
  }

  /** Set has (using the specified store) */
  function setHas(IStore _store, bytes32 sourceTable, bytes32 keysHash, bool has) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((has)), getValueFieldLayout());
  }

  /** Get index */
  function getIndex(bytes32 sourceTable, bytes32 keysHash) internal view returns (uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1, getValueFieldLayout());
    return (uint40(Bytes.slice5(_blob, 0)));
  }

  /** Get index (using the specified store) */
  function getIndex(IStore _store, bytes32 sourceTable, bytes32 keysHash) internal view returns (uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1, getValueFieldLayout());
    return (uint40(Bytes.slice5(_blob, 0)));
  }

  /** Set index */
  function setIndex(bytes32 sourceTable, bytes32 keysHash, uint40 index) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((index)), getValueFieldLayout());
  }

  /** Set index (using the specified store) */
  function setIndex(IStore _store, bytes32 sourceTable, bytes32 keysHash, uint40 index) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((index)), getValueFieldLayout());
  }

  /** Get the full data */
  function get(bytes32 sourceTable, bytes32 keysHash) internal view returns (bool has, uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getValueFieldLayout());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 sourceTable, bytes32 keysHash) internal view returns (bool has, uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getValueFieldLayout());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 sourceTable, bytes32 keysHash, bool has, uint40 index) internal {
    bytes memory _data = encode(has, index);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getValueFieldLayout());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 sourceTable, bytes32 keysHash, bool has, uint40 index) internal {
    bytes memory _data = encode(has, index);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    _store.setRecord(_tableId, _keyTuple, _data, getValueFieldLayout());
  }

  /** Decode the tightly packed blob using this table's field layout */
  function decode(bytes memory _blob) internal pure returns (bool has, uint40 index) {
    has = (_toBool(uint8(Bytes.slice1(_blob, 0))));

    index = (uint40(Bytes.slice5(_blob, 1)));
  }

  /** Tightly pack full data using this table's field layout */
  function encode(bool has, uint40 index) internal pure returns (bytes memory) {
    return abi.encodePacked(has, index);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 sourceTable, bytes32 keysHash) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 sourceTable, bytes32 keysHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getValueFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 sourceTable, bytes32 keysHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = sourceTable;
    _keyTuple[1] = keysHash;

    _store.deleteRecord(_tableId, _keyTuple, getValueFieldLayout());
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
