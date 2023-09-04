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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("ResourceAccess")));
bytes32 constant ResourceAccessTableId = _tableId;

library ResourceAccess {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    uint256[] memory _fieldLayout = new uint256[](1);
    _fieldLayout[0] = 1;

    return FieldLayoutLib.encode(_fieldLayout, 0);
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BOOL;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "resourceSelector";
    keyNames[1] = "caller";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "access";
  }

  /** Register the table keys' and values' field layout, key names and value names */
  function register() internal {
    StoreSwitch.registerTable(
      _tableId,
      getFieldLayout(),
      getKeySchema(),
      getValueSchema(),
      getKeyNames(),
      getFieldNames()
    );
  }

  /** Register the table keys' and values' field layout, key names and value names (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, getFieldLayout(), getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get access */
  function get(bytes32 resourceSelector, address caller) internal view returns (bool access) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get access (using the specified store) */
  function get(IStore _store, bytes32 resourceSelector, address caller) internal view returns (bool access) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set access */
  function set(bytes32 resourceSelector, address caller, bool access) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((access)), getFieldLayout());
  }

  /** Set access (using the specified store) */
  function set(IStore _store, bytes32 resourceSelector, address caller, bool access) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((access)), getFieldLayout());
  }

  /** Tightly pack full data using this table's field layout */
  function encode(bool access) internal pure returns (bytes memory) {
    return abi.encodePacked(access);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 resourceSelector, address caller) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 resourceSelector, address caller) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 resourceSelector, address caller) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
