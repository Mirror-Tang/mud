// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "../../IStore.sol";
import { StoreSwitch } from "../../StoreSwitch.sol";
import { StoreCore } from "../../StoreCore.sol";
import { Bytes } from "../../Bytes.sol";
import { Memory } from "../../Memory.sol";
import { SliceLib } from "../../Slice.sol";
import { EncodeArray } from "../../tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "../../FieldLayout.sol";
import { Schema, SchemaLib } from "../../Schema.sol";
import { PackedCounter, PackedCounterLib } from "../../PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("mudstore"), bytes16("Tables")));
bytes32 constant TablesTableId = _tableId;

struct TablesData {
  bytes32 fieldLayout;
  bytes32 keySchema;
  bytes32 valueSchema;
  bytes abiEncodedKeyNames;
  bytes abiEncodedFieldNames;
}

library Tables {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    uint256[] memory _fieldLayout = new uint256[](3);
    _fieldLayout[0] = 32;
    _fieldLayout[1] = 32;
    _fieldLayout[2] = 32;

    return FieldLayoutLib.encode(_fieldLayout, 2);
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](5);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.BYTES32;
    _schema[2] = SchemaType.BYTES32;
    _schema[3] = SchemaType.BYTES;
    _schema[4] = SchemaType.BYTES;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "tableId";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](5);
    fieldNames[0] = "fieldLayout";
    fieldNames[1] = "keySchema";
    fieldNames[2] = "valueSchema";
    fieldNames[3] = "abiEncodedKeyNames";
    fieldNames[4] = "abiEncodedFieldNames";
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

  /** Get fieldLayout */
  function getFieldLayout(bytes32 tableId) internal view returns (bytes32 fieldLayout) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (Bytes.slice32(_blob, 0));
  }

  /** Get fieldLayout (using the specified store) */
  function getFieldLayout(IStore _store, bytes32 tableId) internal view returns (bytes32 fieldLayout) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (Bytes.slice32(_blob, 0));
  }

  /** Set fieldLayout */
  function setFieldLayout(bytes32 tableId, bytes32 fieldLayout) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((fieldLayout)), getFieldLayout());
  }

  /** Set fieldLayout (using the specified store) */
  function setFieldLayout(IStore _store, bytes32 tableId, bytes32 fieldLayout) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((fieldLayout)), getFieldLayout());
  }

  /** Get keySchema */
  function getKeySchema(bytes32 tableId) internal view returns (bytes32 keySchema) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1, getFieldLayout());
    return (Bytes.slice32(_blob, 0));
  }

  /** Get keySchema (using the specified store) */
  function getKeySchema(IStore _store, bytes32 tableId) internal view returns (bytes32 keySchema) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1, getFieldLayout());
    return (Bytes.slice32(_blob, 0));
  }

  /** Set keySchema */
  function setKeySchema(bytes32 tableId, bytes32 keySchema) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((keySchema)), getFieldLayout());
  }

  /** Set keySchema (using the specified store) */
  function setKeySchema(IStore _store, bytes32 tableId, bytes32 keySchema) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((keySchema)), getFieldLayout());
  }

  /** Get valueSchema */
  function getValueSchema(bytes32 tableId) internal view returns (bytes32 valueSchema) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2, getFieldLayout());
    return (Bytes.slice32(_blob, 0));
  }

  /** Get valueSchema (using the specified store) */
  function getValueSchema(IStore _store, bytes32 tableId) internal view returns (bytes32 valueSchema) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2, getFieldLayout());
    return (Bytes.slice32(_blob, 0));
  }

  /** Set valueSchema */
  function setValueSchema(bytes32 tableId, bytes32 valueSchema) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((valueSchema)), getFieldLayout());
  }

  /** Set valueSchema (using the specified store) */
  function setValueSchema(IStore _store, bytes32 tableId, bytes32 valueSchema) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((valueSchema)), getFieldLayout());
  }

  /** Get abiEncodedKeyNames */
  function getAbiEncodedKeyNames(bytes32 tableId) internal view returns (bytes memory abiEncodedKeyNames) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3, getFieldLayout());
    return (bytes(_blob));
  }

  /** Get abiEncodedKeyNames (using the specified store) */
  function getAbiEncodedKeyNames(
    IStore _store,
    bytes32 tableId
  ) internal view returns (bytes memory abiEncodedKeyNames) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3, getFieldLayout());
    return (bytes(_blob));
  }

  /** Set abiEncodedKeyNames */
  function setAbiEncodedKeyNames(bytes32 tableId, bytes memory abiEncodedKeyNames) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.setField(_tableId, _keyTuple, 3, bytes((abiEncodedKeyNames)), getFieldLayout());
  }

  /** Set abiEncodedKeyNames (using the specified store) */
  function setAbiEncodedKeyNames(IStore _store, bytes32 tableId, bytes memory abiEncodedKeyNames) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.setField(_tableId, _keyTuple, 3, bytes((abiEncodedKeyNames)), getFieldLayout());
  }

  /** Get the length of abiEncodedKeyNames */
  function lengthAbiEncodedKeyNames(bytes32 tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 3, getFieldLayout());
    unchecked {
      return _byteLength / 1;
    }
  }

  /** Get the length of abiEncodedKeyNames (using the specified store) */
  function lengthAbiEncodedKeyNames(IStore _store, bytes32 tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 3, getFieldLayout());
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * Get an item of abiEncodedKeyNames
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemAbiEncodedKeyNames(bytes32 tableId, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        3,
        getFieldLayout(),
        _index * 1,
        (_index + 1) * 1
      );
      return (bytes(_blob));
    }
  }

  /**
   * Get an item of abiEncodedKeyNames (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemAbiEncodedKeyNames(
    IStore _store,
    bytes32 tableId,
    uint256 _index
  ) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 3, getFieldLayout(), _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /** Push a slice to abiEncodedKeyNames */
  function pushAbiEncodedKeyNames(bytes32 tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.pushToField(_tableId, _keyTuple, 3, bytes((_slice)), getFieldLayout());
  }

  /** Push a slice to abiEncodedKeyNames (using the specified store) */
  function pushAbiEncodedKeyNames(IStore _store, bytes32 tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.pushToField(_tableId, _keyTuple, 3, bytes((_slice)), getFieldLayout());
  }

  /** Pop a slice from abiEncodedKeyNames */
  function popAbiEncodedKeyNames(bytes32 tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.popFromField(_tableId, _keyTuple, 3, 1, getFieldLayout());
  }

  /** Pop a slice from abiEncodedKeyNames (using the specified store) */
  function popAbiEncodedKeyNames(IStore _store, bytes32 tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.popFromField(_tableId, _keyTuple, 3, 1, getFieldLayout());
  }

  /**
   * Update a slice of abiEncodedKeyNames at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateAbiEncodedKeyNames(bytes32 tableId, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 3, _index * 1, bytes((_slice)), getFieldLayout());
    }
  }

  /**
   * Update a slice of abiEncodedKeyNames (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateAbiEncodedKeyNames(IStore _store, bytes32 tableId, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 3, _index * 1, bytes((_slice)), getFieldLayout());
    }
  }

  /** Get abiEncodedFieldNames */
  function getAbiEncodedFieldNames(bytes32 tableId) internal view returns (bytes memory abiEncodedFieldNames) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4, getFieldLayout());
    return (bytes(_blob));
  }

  /** Get abiEncodedFieldNames (using the specified store) */
  function getAbiEncodedFieldNames(
    IStore _store,
    bytes32 tableId
  ) internal view returns (bytes memory abiEncodedFieldNames) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4, getFieldLayout());
    return (bytes(_blob));
  }

  /** Set abiEncodedFieldNames */
  function setAbiEncodedFieldNames(bytes32 tableId, bytes memory abiEncodedFieldNames) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.setField(_tableId, _keyTuple, 4, bytes((abiEncodedFieldNames)), getFieldLayout());
  }

  /** Set abiEncodedFieldNames (using the specified store) */
  function setAbiEncodedFieldNames(IStore _store, bytes32 tableId, bytes memory abiEncodedFieldNames) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.setField(_tableId, _keyTuple, 4, bytes((abiEncodedFieldNames)), getFieldLayout());
  }

  /** Get the length of abiEncodedFieldNames */
  function lengthAbiEncodedFieldNames(bytes32 tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 4, getFieldLayout());
    unchecked {
      return _byteLength / 1;
    }
  }

  /** Get the length of abiEncodedFieldNames (using the specified store) */
  function lengthAbiEncodedFieldNames(IStore _store, bytes32 tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 4, getFieldLayout());
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * Get an item of abiEncodedFieldNames
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemAbiEncodedFieldNames(bytes32 tableId, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        4,
        getFieldLayout(),
        _index * 1,
        (_index + 1) * 1
      );
      return (bytes(_blob));
    }
  }

  /**
   * Get an item of abiEncodedFieldNames (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemAbiEncodedFieldNames(
    IStore _store,
    bytes32 tableId,
    uint256 _index
  ) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 4, getFieldLayout(), _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /** Push a slice to abiEncodedFieldNames */
  function pushAbiEncodedFieldNames(bytes32 tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.pushToField(_tableId, _keyTuple, 4, bytes((_slice)), getFieldLayout());
  }

  /** Push a slice to abiEncodedFieldNames (using the specified store) */
  function pushAbiEncodedFieldNames(IStore _store, bytes32 tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.pushToField(_tableId, _keyTuple, 4, bytes((_slice)), getFieldLayout());
  }

  /** Pop a slice from abiEncodedFieldNames */
  function popAbiEncodedFieldNames(bytes32 tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.popFromField(_tableId, _keyTuple, 4, 1, getFieldLayout());
  }

  /** Pop a slice from abiEncodedFieldNames (using the specified store) */
  function popAbiEncodedFieldNames(IStore _store, bytes32 tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.popFromField(_tableId, _keyTuple, 4, 1, getFieldLayout());
  }

  /**
   * Update a slice of abiEncodedFieldNames at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateAbiEncodedFieldNames(bytes32 tableId, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 4, _index * 1, bytes((_slice)), getFieldLayout());
    }
  }

  /**
   * Update a slice of abiEncodedFieldNames (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateAbiEncodedFieldNames(IStore _store, bytes32 tableId, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 4, _index * 1, bytes((_slice)), getFieldLayout());
    }
  }

  /** Get the full data */
  function get(bytes32 tableId) internal view returns (TablesData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getFieldLayout());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 tableId) internal view returns (TablesData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getFieldLayout());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    bytes32 tableId,
    bytes32 fieldLayout,
    bytes32 keySchema,
    bytes32 valueSchema,
    bytes memory abiEncodedKeyNames,
    bytes memory abiEncodedFieldNames
  ) internal {
    bytes memory _data = encode(fieldLayout, keySchema, valueSchema, abiEncodedKeyNames, abiEncodedFieldNames);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getFieldLayout());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 tableId,
    bytes32 fieldLayout,
    bytes32 keySchema,
    bytes32 valueSchema,
    bytes memory abiEncodedKeyNames,
    bytes memory abiEncodedFieldNames
  ) internal {
    bytes memory _data = encode(fieldLayout, keySchema, valueSchema, abiEncodedKeyNames, abiEncodedFieldNames);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.setRecord(_tableId, _keyTuple, _data, getFieldLayout());
  }

  /** Set the full data using the data struct */
  function set(bytes32 tableId, TablesData memory _table) internal {
    set(
      tableId,
      _table.fieldLayout,
      _table.keySchema,
      _table.valueSchema,
      _table.abiEncodedKeyNames,
      _table.abiEncodedFieldNames
    );
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 tableId, TablesData memory _table) internal {
    set(
      _store,
      tableId,
      _table.fieldLayout,
      _table.keySchema,
      _table.valueSchema,
      _table.abiEncodedKeyNames,
      _table.abiEncodedFieldNames
    );
  }

  /**
   * Decode the tightly packed blob using this table's field layout.
   * Undefined behaviour for invalid blobs.
   */
  function decode(bytes memory _blob) internal pure returns (TablesData memory _table) {
    // 96 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 96));

    _table.fieldLayout = (Bytes.slice32(_blob, 0));

    _table.keySchema = (Bytes.slice32(_blob, 32));

    _table.valueSchema = (Bytes.slice32(_blob, 64));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 96) {
      // skip static data length + dynamic lengths word
      uint256 _start = 128;
      uint256 _end;
      unchecked {
        _end = 128 + _encodedLengths.atIndex(0);
      }
      _table.abiEncodedKeyNames = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      unchecked {
        _end += _encodedLengths.atIndex(1);
      }
      _table.abiEncodedFieldNames = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's field layout */
  function encode(
    bytes32 fieldLayout,
    bytes32 keySchema,
    bytes32 valueSchema,
    bytes memory abiEncodedKeyNames,
    bytes memory abiEncodedFieldNames
  ) internal pure returns (bytes memory) {
    PackedCounter _encodedLengths;
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(bytes(abiEncodedKeyNames).length, bytes(abiEncodedFieldNames).length);
    }

    return
      abi.encodePacked(
        fieldLayout,
        keySchema,
        valueSchema,
        _encodedLengths.unwrap(),
        bytes((abiEncodedKeyNames)),
        bytes((abiEncodedFieldNames))
      );
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 tableId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = tableId;

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}
