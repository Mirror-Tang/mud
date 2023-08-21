// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "../../IStore.sol";
import { StoreSwitch } from "../../StoreSwitch.sol";
import { StoreCore } from "../../StoreCore.sol";
import { Bytes } from "../../Bytes.sol";
import { Memory } from "../../Memory.sol";
import { SliceLib } from "../../Slice.sol";
import { EncodeArray } from "../../tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "../../Schema.sol";
import { PackedCounter, PackedCounterLib } from "../../PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("mudstore"), bytes16("Hooks")));
bytes32 constant HooksTableId = _tableId;

library Hooks {
  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    uint256[] memory _schema = new uint256[](1);
    _schema[0] = 32;

    return SchemaLib.encode(_schema, 0);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    uint256[] memory _schema = new uint256[](0);

    return SchemaLib.encode(_schema, 1);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "key";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "value";
  }

  /** Register the table's key schema, value schema, key names and value names */
  function register() internal {
    StoreSwitch.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table's key schema, value schema, key names and value names (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get value */
  function get(bytes32 key) internal view returns (address[] memory value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Get value (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (address[] memory value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Set value */
  function set(bytes32 key, address[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)), getValueSchema());
  }

  /** Set value (using the specified store) */
  function set(IStore _store, bytes32 key, address[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)), getValueSchema());
  }

  /** Get the length of value */
  function length(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getValueSchema());
    unchecked {
      return _byteLength / 20;
    }
  }

  /** Get the length of value (using the specified store) */
  function length(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getValueSchema());
    unchecked {
      return _byteLength / 20;
    }
  }

  /**
   * Get an item of value
   * (unchecked, returns invalid data if index overflows)
   */
  function getItem(bytes32 key, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        0,
        getValueSchema(),
        _index * 20,
        (_index + 1) * 20
      );
      return (address(Bytes.slice20(_blob, 0)));
    }
  }

  /**
   * Get an item of value (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItem(IStore _store, bytes32 key, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(
        _tableId,
        _keyTuple,
        0,
        getValueSchema(),
        _index * 20,
        (_index + 1) * 20
      );
      return (address(Bytes.slice20(_blob, 0)));
    }
  }

  /** Push an element to value */
  function push(bytes32 key, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), getValueSchema());
  }

  /** Push an element to value (using the specified store) */
  function push(IStore _store, bytes32 key, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), getValueSchema());
  }

  /** Pop an element from value */
  function pop(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 20, getValueSchema());
  }

  /** Pop an element from value (using the specified store) */
  function pop(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 0, 20, getValueSchema());
  }

  /**
   * Update an element of value at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 20, abi.encodePacked((_element)), getValueSchema());
    }
  }

  /**
   * Update an element of value (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(IStore _store, bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 0, _index * 20, abi.encodePacked((_element)), getValueSchema());
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(address[] memory value) internal pure returns (bytes memory) {
    PackedCounter _encodedLengths;
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(value.length * 20);
    }

    return abi.encodePacked(_encodedLengths.unwrap(), EncodeArray.encode((value)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }
}
