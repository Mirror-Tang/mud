// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

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

// Import user types
import { Resource } from "./../../../Types.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("ResourceType")));
bytes32 constant ResourceTypeTableId = _tableId;

library ResourceType {
  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    uint256[] memory _schema = new uint256[](1);
    _schema[0] = 32;

    return SchemaLib.encode(_schema, 0);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    uint256[] memory _schema = new uint256[](1);
    _schema[0] = 1;

    return SchemaLib.encode(_schema, 0);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "resourceSelector";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "resourceType";
  }

  /** Register the table's key schema, value schema, key names and value names */
  function register() internal {
    StoreSwitch.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table's key schema, value schema, key names and value names (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get resourceType */
  function get(bytes32 resourceSelector) internal view returns (Resource resourceType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getValueSchema());
    return Resource(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get resourceType (using the specified store) */
  function get(IStore _store, bytes32 resourceSelector) internal view returns (Resource resourceType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getValueSchema());
    return Resource(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Set resourceType */
  function set(bytes32 resourceSelector, Resource resourceType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(resourceType)), getValueSchema());
  }

  /** Set resourceType (using the specified store) */
  function set(IStore _store, bytes32 resourceSelector, Resource resourceType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(resourceType)), getValueSchema());
  }

  /** Tightly pack full data using this table's schema */
  function encode(Resource resourceType) internal pure returns (bytes memory) {
    return abi.encodePacked(resourceType);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 resourceSelector) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }
}
