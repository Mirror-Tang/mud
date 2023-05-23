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
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("KeysInTable")));
bytes32 constant KeysInTableTableId = _tableId;

struct KeysInTableData {
  bytes32[] keys0;
  bytes32[] keys1;
  bytes32[] keys2;
  bytes32[] keys3;
  bytes32[] keys4;
}

library KeysInTable {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](5);
    _schema[0] = SchemaType.BYTES32_ARRAY;
    _schema[1] = SchemaType.BYTES32_ARRAY;
    _schema[2] = SchemaType.BYTES32_ARRAY;
    _schema[3] = SchemaType.BYTES32_ARRAY;
    _schema[4] = SchemaType.BYTES32_ARRAY;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](5);
    _fieldNames[0] = "keys0";
    _fieldNames[1] = "keys1";
    _fieldNames[2] = "keys2";
    _fieldNames[3] = "keys3";
    _fieldNames[4] = "keys4";
    return ("KeysInTable", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get keys0 */
  function getKeys0(bytes32 sourceTable) internal view returns (bytes32[] memory keys0) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys0 (using the specified store) */
  function getKeys0(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys0) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys0 */
  function setKeys0(bytes32 sourceTable, bytes32[] memory keys0) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode((keys0)));
  }

  /** Set keys0 (using the specified store) */
  function setKeys0(IStore _store, bytes32 sourceTable, bytes32[] memory keys0) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode((keys0)));
  }

  /** Get the length of keys0 */
  function lengthKeys0(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 32;
  }

  /** Get the length of keys0 (using the specified store) */
  function lengthKeys0(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 32;
  }

  /** Get an item of keys0 (unchecked, returns invalid data if index overflows) */
  function getItemKeys0(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get an item of keys0 (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemKeys0(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Push an element to keys0 */
  function pushKeys0(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Push an element to keys0 (using the specified store) */
  function pushKeys0(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Pop an element from keys0 */
  function popKeys0(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 32);
  }

  /** Pop an element from keys0 (using the specified store) */
  function popKeys0(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.popFromField(_tableId, _keyTuple, 0, 32);
  }

  /** Update an element of keys0 at `_index` */
  function updateKeys0(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 32, abi.encodePacked((_element)));
  }

  /** Update an element of keys0 (using the specified store) at `_index` */
  function updateKeys0(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.updateInField(_tableId, _keyTuple, 0, _index * 32, abi.encodePacked((_element)));
  }

  /** Get keys1 */
  function getKeys1(bytes32 sourceTable) internal view returns (bytes32[] memory keys1) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys1 (using the specified store) */
  function getKeys1(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys1) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys1 */
  function setKeys1(bytes32 sourceTable, bytes32[] memory keys1) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.setField(_tableId, _keyTuple, 1, EncodeArray.encode((keys1)));
  }

  /** Set keys1 (using the specified store) */
  function setKeys1(IStore _store, bytes32 sourceTable, bytes32[] memory keys1) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.setField(_tableId, _keyTuple, 1, EncodeArray.encode((keys1)));
  }

  /** Get the length of keys1 */
  function lengthKeys1(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 32;
  }

  /** Get the length of keys1 (using the specified store) */
  function lengthKeys1(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 32;
  }

  /** Get an item of keys1 (unchecked, returns invalid data if index overflows) */
  function getItemKeys1(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get an item of keys1 (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemKeys1(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Push an element to keys1 */
  function pushKeys1(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.pushToField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /** Push an element to keys1 (using the specified store) */
  function pushKeys1(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.pushToField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /** Pop an element from keys1 */
  function popKeys1(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.popFromField(_tableId, _keyTuple, 1, 32);
  }

  /** Pop an element from keys1 (using the specified store) */
  function popKeys1(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.popFromField(_tableId, _keyTuple, 1, 32);
  }

  /** Update an element of keys1 at `_index` */
  function updateKeys1(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.updateInField(_tableId, _keyTuple, 1, _index * 32, abi.encodePacked((_element)));
  }

  /** Update an element of keys1 (using the specified store) at `_index` */
  function updateKeys1(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.updateInField(_tableId, _keyTuple, 1, _index * 32, abi.encodePacked((_element)));
  }

  /** Get keys2 */
  function getKeys2(bytes32 sourceTable) internal view returns (bytes32[] memory keys2) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys2 (using the specified store) */
  function getKeys2(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys2) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys2 */
  function setKeys2(bytes32 sourceTable, bytes32[] memory keys2) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.setField(_tableId, _keyTuple, 2, EncodeArray.encode((keys2)));
  }

  /** Set keys2 (using the specified store) */
  function setKeys2(IStore _store, bytes32 sourceTable, bytes32[] memory keys2) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.setField(_tableId, _keyTuple, 2, EncodeArray.encode((keys2)));
  }

  /** Get the length of keys2 */
  function lengthKeys2(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 32;
  }

  /** Get the length of keys2 (using the specified store) */
  function lengthKeys2(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 32;
  }

  /** Get an item of keys2 (unchecked, returns invalid data if index overflows) */
  function getItemKeys2(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get an item of keys2 (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemKeys2(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Push an element to keys2 */
  function pushKeys2(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.pushToField(_tableId, _keyTuple, 2, abi.encodePacked((_element)));
  }

  /** Push an element to keys2 (using the specified store) */
  function pushKeys2(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.pushToField(_tableId, _keyTuple, 2, abi.encodePacked((_element)));
  }

  /** Pop an element from keys2 */
  function popKeys2(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.popFromField(_tableId, _keyTuple, 2, 32);
  }

  /** Pop an element from keys2 (using the specified store) */
  function popKeys2(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.popFromField(_tableId, _keyTuple, 2, 32);
  }

  /** Update an element of keys2 at `_index` */
  function updateKeys2(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.updateInField(_tableId, _keyTuple, 2, _index * 32, abi.encodePacked((_element)));
  }

  /** Update an element of keys2 (using the specified store) at `_index` */
  function updateKeys2(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.updateInField(_tableId, _keyTuple, 2, _index * 32, abi.encodePacked((_element)));
  }

  /** Get keys3 */
  function getKeys3(bytes32 sourceTable) internal view returns (bytes32[] memory keys3) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys3 (using the specified store) */
  function getKeys3(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys3) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys3 */
  function setKeys3(bytes32 sourceTable, bytes32[] memory keys3) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.setField(_tableId, _keyTuple, 3, EncodeArray.encode((keys3)));
  }

  /** Set keys3 (using the specified store) */
  function setKeys3(IStore _store, bytes32 sourceTable, bytes32[] memory keys3) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.setField(_tableId, _keyTuple, 3, EncodeArray.encode((keys3)));
  }

  /** Get the length of keys3 */
  function lengthKeys3(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 3, getSchema());
    return _byteLength / 32;
  }

  /** Get the length of keys3 (using the specified store) */
  function lengthKeys3(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 3, getSchema());
    return _byteLength / 32;
  }

  /** Get an item of keys3 (unchecked, returns invalid data if index overflows) */
  function getItemKeys3(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 3, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get an item of keys3 (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemKeys3(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 3, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Push an element to keys3 */
  function pushKeys3(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.pushToField(_tableId, _keyTuple, 3, abi.encodePacked((_element)));
  }

  /** Push an element to keys3 (using the specified store) */
  function pushKeys3(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.pushToField(_tableId, _keyTuple, 3, abi.encodePacked((_element)));
  }

  /** Pop an element from keys3 */
  function popKeys3(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.popFromField(_tableId, _keyTuple, 3, 32);
  }

  /** Pop an element from keys3 (using the specified store) */
  function popKeys3(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.popFromField(_tableId, _keyTuple, 3, 32);
  }

  /** Update an element of keys3 at `_index` */
  function updateKeys3(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.updateInField(_tableId, _keyTuple, 3, _index * 32, abi.encodePacked((_element)));
  }

  /** Update an element of keys3 (using the specified store) at `_index` */
  function updateKeys3(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.updateInField(_tableId, _keyTuple, 3, _index * 32, abi.encodePacked((_element)));
  }

  /** Get keys4 */
  function getKeys4(bytes32 sourceTable) internal view returns (bytes32[] memory keys4) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys4 (using the specified store) */
  function getKeys4(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys4) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys4 */
  function setKeys4(bytes32 sourceTable, bytes32[] memory keys4) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.setField(_tableId, _keyTuple, 4, EncodeArray.encode((keys4)));
  }

  /** Set keys4 (using the specified store) */
  function setKeys4(IStore _store, bytes32 sourceTable, bytes32[] memory keys4) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.setField(_tableId, _keyTuple, 4, EncodeArray.encode((keys4)));
  }

  /** Get the length of keys4 */
  function lengthKeys4(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 4, getSchema());
    return _byteLength / 32;
  }

  /** Get the length of keys4 (using the specified store) */
  function lengthKeys4(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 4, getSchema());
    return _byteLength / 32;
  }

  /** Get an item of keys4 (unchecked, returns invalid data if index overflows) */
  function getItemKeys4(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 4, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get an item of keys4 (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemKeys4(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 4, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Push an element to keys4 */
  function pushKeys4(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.pushToField(_tableId, _keyTuple, 4, abi.encodePacked((_element)));
  }

  /** Push an element to keys4 (using the specified store) */
  function pushKeys4(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.pushToField(_tableId, _keyTuple, 4, abi.encodePacked((_element)));
  }

  /** Pop an element from keys4 */
  function popKeys4(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.popFromField(_tableId, _keyTuple, 4, 32);
  }

  /** Pop an element from keys4 (using the specified store) */
  function popKeys4(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.popFromField(_tableId, _keyTuple, 4, 32);
  }

  /** Update an element of keys4 at `_index` */
  function updateKeys4(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.updateInField(_tableId, _keyTuple, 4, _index * 32, abi.encodePacked((_element)));
  }

  /** Update an element of keys4 (using the specified store) at `_index` */
  function updateKeys4(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.updateInField(_tableId, _keyTuple, 4, _index * 32, abi.encodePacked((_element)));
  }

  /** Get the full data */
  function get(bytes32 sourceTable) internal view returns (KeysInTableData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 sourceTable) internal view returns (KeysInTableData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    bytes32 sourceTable,
    bytes32[] memory keys0,
    bytes32[] memory keys1,
    bytes32[] memory keys2,
    bytes32[] memory keys3,
    bytes32[] memory keys4
  ) internal {
    bytes memory _data = encode(keys0, keys1, keys2, keys3, keys4);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 sourceTable,
    bytes32[] memory keys0,
    bytes32[] memory keys1,
    bytes32[] memory keys2,
    bytes32[] memory keys3,
    bytes32[] memory keys4
  ) internal {
    bytes memory _data = encode(keys0, keys1, keys2, keys3, keys4);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 sourceTable, KeysInTableData memory _table) internal {
    set(sourceTable, _table.keys0, _table.keys1, _table.keys2, _table.keys3, _table.keys4);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 sourceTable, KeysInTableData memory _table) internal {
    set(_store, sourceTable, _table.keys0, _table.keys1, _table.keys2, _table.keys3, _table.keys4);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (KeysInTableData memory _table) {
    // 0 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 0));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 0) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 32;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.keys0 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      _end += _encodedLengths.atIndex(1);
      _table.keys1 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      _end += _encodedLengths.atIndex(2);
      _table.keys2 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      _end += _encodedLengths.atIndex(3);
      _table.keys3 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      _end += _encodedLengths.atIndex(4);
      _table.keys4 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    bytes32[] memory keys0,
    bytes32[] memory keys1,
    bytes32[] memory keys2,
    bytes32[] memory keys3,
    bytes32[] memory keys4
  ) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](5);
    _counters[0] = uint40(keys0.length * 32);
    _counters[1] = uint40(keys1.length * 32);
    _counters[2] = uint40(keys2.length * 32);
    _counters[3] = uint40(keys3.length * 32);
    _counters[4] = uint40(keys4.length * 32);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return
      abi.encodePacked(
        _encodedLengths.unwrap(),
        EncodeArray.encode((keys0)),
        EncodeArray.encode((keys1)),
        EncodeArray.encode((keys2)),
        EncodeArray.encode((keys3)),
        EncodeArray.encode((keys4))
      );
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 sourceTable) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((sourceTable));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
