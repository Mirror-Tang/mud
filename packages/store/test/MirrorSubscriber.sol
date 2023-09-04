// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { IStore, IStoreHook } from "../src/IStore.sol";
import { StoreSwitch } from "../src/StoreSwitch.sol";
import { FieldLayout } from "../src/FieldLayout.sol";
import { Schema } from "../src/Schema.sol";

bytes32 constant indexerTableId = keccak256("indexer.table");

contract MirrorSubscriber is IStoreHook {
  bytes32 _table;

  constructor(
    bytes32 table,
    FieldLayout fieldLayout,
    Schema keySchema,
    Schema valueSchema,
    string[] memory keyNames,
    string[] memory fieldNames
  ) {
    IStore(msg.sender).registerTable(indexerTableId, fieldLayout, keySchema, valueSchema, keyNames, fieldNames);
    _table = table;
  }

  function onSetRecord(bytes32 table, bytes32[] memory key, bytes memory data, FieldLayout fieldLayout) public {
    if (table != table) revert("invalid table");
    StoreSwitch.setRecord(indexerTableId, key, data, fieldLayout);
  }

  function onBeforeSetField(
    bytes32 table,
    bytes32[] memory key,
    uint8 schemaIndex,
    bytes memory data,
    FieldLayout fieldLayout
  ) public {
    if (table != table) revert("invalid table");
    StoreSwitch.setField(indexerTableId, key, schemaIndex, data, fieldLayout);
  }

  function onAfterSetField(bytes32, bytes32[] memory, uint8, bytes memory, FieldLayout) public {}

  function onDeleteRecord(bytes32 table, bytes32[] memory key, FieldLayout fieldLayout) public {
    if (table != table) revert("invalid table");
    StoreSwitch.deleteRecord(indexerTableId, key, fieldLayout);
  }
}
