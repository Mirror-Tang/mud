import { describe, it, expect } from "vitest";
import { createSqliteTable } from "./createSqliteTable";

describe("createSqliteTable", () => {
  it("should create table from schema", async () => {
    const table = createSqliteTable({
      address: "0xffffffffffffffffffffffffffffffffffffffff",
      namespace: "test",
      name: "users",
      keySchema: { x: "uint32", y: "uint32" },
      valueSchema: { name: "string", addr: "address" },
    });

    expect(table).toMatchInlineSnapshot(`
      SQLiteTable {
        "__data": SQLiteText {
          "columnType": "SQLiteText",
          "config": {
            "columnType": "SQLiteText",
            "dataType": "string",
            "default": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "__data",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___data_unique",
            "uniqueType": undefined,
          },
          "dataType": "string",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "length": undefined,
          "name": "__data",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___data_unique",
          "uniqueType": undefined,
        },
        "__isDeleted": SQLiteBoolean {
          "autoIncrement": false,
          "columnType": "SQLiteBoolean",
          "config": {
            "autoIncrement": false,
            "columnType": "SQLiteBoolean",
            "dataType": "boolean",
            "default": undefined,
            "hasDefault": false,
            "isUnique": false,
            "mode": "boolean",
            "name": "__isDeleted",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___isDeleted_unique",
            "uniqueType": undefined,
          },
          "dataType": "boolean",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "mode": "boolean",
          "name": "__isDeleted",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___isDeleted_unique",
          "uniqueType": undefined,
        },
        "__key": SQLiteText {
          "columnType": "SQLiteText",
          "config": {
            "columnType": "SQLiteText",
            "dataType": "string",
            "default": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "__key",
            "notNull": true,
            "primaryKey": true,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___key_unique",
            "uniqueType": undefined,
          },
          "dataType": "string",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "length": undefined,
          "name": "__key",
          "notNull": true,
          "primary": true,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___key_unique",
          "uniqueType": undefined,
        },
        "__lastUpdatedBlockNumber": SQLiteBigInt {
          "columnType": "SQLiteBigInt",
          "config": {
            "columnType": "SQLiteBigInt",
            "dataType": "bigint",
            "default": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___lastUpdatedBlockNumber_unique",
            "uniqueType": undefined,
          },
          "dataType": "bigint",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "name": "__lastUpdatedBlockNumber",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___lastUpdatedBlockNumber_unique",
          "uniqueType": undefined,
        },
        "addr": SQLiteCustomColumn {
          "columnType": "SQLiteCustomColumn",
          "config": {
            "columnType": "SQLiteCustomColumn",
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "dataType": "custom",
            "default": undefined,
            "fieldConfig": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "addr",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_addr_unique",
            "uniqueType": undefined,
          },
          "dataType": "custom",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "addr",
          "notNull": true,
          "primary": false,
          "sqlName": "text",
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_addr_unique",
          "uniqueType": undefined,
        },
        "name": SQLiteText {
          "columnType": "SQLiteText",
          "config": {
            "columnType": "SQLiteText",
            "dataType": "string",
            "default": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "name",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_name_unique",
            "uniqueType": undefined,
          },
          "dataType": "string",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "length": undefined,
          "name": "name",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_name_unique",
          "uniqueType": undefined,
        },
        "x": SQLiteInteger {
          "autoIncrement": false,
          "columnType": "SQLiteInteger",
          "config": {
            "autoIncrement": false,
            "columnType": "SQLiteInteger",
            "dataType": "number",
            "default": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "x",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_x_unique",
            "uniqueType": undefined,
          },
          "dataType": "number",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "name": "x",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_x_unique",
          "uniqueType": undefined,
        },
        "y": SQLiteInteger {
          "autoIncrement": false,
          "columnType": "SQLiteInteger",
          "config": {
            "autoIncrement": false,
            "columnType": "SQLiteInteger",
            "dataType": "number",
            "default": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "y",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_y_unique",
            "uniqueType": undefined,
          },
          "dataType": "number",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "name": "y",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_y_unique",
          "uniqueType": undefined,
        },
        Symbol(drizzle:Name): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users",
        Symbol(drizzle:OriginalName): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users",
        Symbol(drizzle:Schema): undefined,
        Symbol(drizzle:Columns): {
          "__data": SQLiteText {
            "columnType": "SQLiteText",
            "config": {
              "columnType": "SQLiteText",
              "dataType": "string",
              "default": undefined,
              "enumValues": undefined,
              "hasDefault": false,
              "isUnique": false,
              "length": undefined,
              "name": "__data",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___data_unique",
              "uniqueType": undefined,
            },
            "dataType": "string",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "__data",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___data_unique",
            "uniqueType": undefined,
          },
          "__isDeleted": SQLiteBoolean {
            "autoIncrement": false,
            "columnType": "SQLiteBoolean",
            "config": {
              "autoIncrement": false,
              "columnType": "SQLiteBoolean",
              "dataType": "boolean",
              "default": undefined,
              "hasDefault": false,
              "isUnique": false,
              "mode": "boolean",
              "name": "__isDeleted",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___isDeleted_unique",
              "uniqueType": undefined,
            },
            "dataType": "boolean",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "mode": "boolean",
            "name": "__isDeleted",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___isDeleted_unique",
            "uniqueType": undefined,
          },
          "__key": SQLiteText {
            "columnType": "SQLiteText",
            "config": {
              "columnType": "SQLiteText",
              "dataType": "string",
              "default": undefined,
              "enumValues": undefined,
              "hasDefault": false,
              "isUnique": false,
              "length": undefined,
              "name": "__key",
              "notNull": true,
              "primaryKey": true,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___key_unique",
              "uniqueType": undefined,
            },
            "dataType": "string",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "__key",
            "notNull": true,
            "primary": true,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___key_unique",
            "uniqueType": undefined,
          },
          "__lastUpdatedBlockNumber": SQLiteBigInt {
            "columnType": "SQLiteBigInt",
            "config": {
              "columnType": "SQLiteBigInt",
              "dataType": "bigint",
              "default": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "__lastUpdatedBlockNumber",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___lastUpdatedBlockNumber_unique",
              "uniqueType": undefined,
            },
            "dataType": "bigint",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___lastUpdatedBlockNumber_unique",
            "uniqueType": undefined,
          },
          "addr": SQLiteCustomColumn {
            "columnType": "SQLiteCustomColumn",
            "config": {
              "columnType": "SQLiteCustomColumn",
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "dataType": "custom",
              "default": undefined,
              "fieldConfig": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "addr",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_addr_unique",
              "uniqueType": undefined,
            },
            "dataType": "custom",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "addr",
            "notNull": true,
            "primary": false,
            "sqlName": "text",
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_addr_unique",
            "uniqueType": undefined,
          },
          "name": SQLiteText {
            "columnType": "SQLiteText",
            "config": {
              "columnType": "SQLiteText",
              "dataType": "string",
              "default": undefined,
              "enumValues": undefined,
              "hasDefault": false,
              "isUnique": false,
              "length": undefined,
              "name": "name",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_name_unique",
              "uniqueType": undefined,
            },
            "dataType": "string",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "name",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_name_unique",
            "uniqueType": undefined,
          },
          "x": SQLiteInteger {
            "autoIncrement": false,
            "columnType": "SQLiteInteger",
            "config": {
              "autoIncrement": false,
              "columnType": "SQLiteInteger",
              "dataType": "number",
              "default": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "x",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_x_unique",
              "uniqueType": undefined,
            },
            "dataType": "number",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "x",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_x_unique",
            "uniqueType": undefined,
          },
          "y": SQLiteInteger {
            "autoIncrement": false,
            "columnType": "SQLiteInteger",
            "config": {
              "autoIncrement": false,
              "columnType": "SQLiteInteger",
              "dataType": "number",
              "default": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "y",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_y_unique",
              "uniqueType": undefined,
            },
            "dataType": "number",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "y",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_y_unique",
            "uniqueType": undefined,
          },
        },
        Symbol(drizzle:BaseName): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users",
        Symbol(drizzle:IsAlias): false,
        Symbol(drizzle:ExtraConfigBuilder): undefined,
        Symbol(drizzle:IsDrizzleTable): true,
        Symbol(drizzle:SQLiteInlineForeignKeys): [],
      }
    `);
  });

  it("can create a singleton table", async () => {
    const table = createSqliteTable({
      address: "0xffffffffffffffffffffffffffffffffffffffff",
      namespace: "test",
      name: "users",
      keySchema: {},
      valueSchema: { addrs: "address[]" },
    });

    expect(table).toMatchInlineSnapshot(`
      SQLiteTable {
        "__data": SQLiteText {
          "columnType": "SQLiteText",
          "config": {
            "columnType": "SQLiteText",
            "dataType": "string",
            "default": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "__data",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___data_unique",
            "uniqueType": undefined,
          },
          "dataType": "string",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "length": undefined,
          "name": "__data",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___data_unique",
          "uniqueType": undefined,
        },
        "__isDeleted": SQLiteBoolean {
          "autoIncrement": false,
          "columnType": "SQLiteBoolean",
          "config": {
            "autoIncrement": false,
            "columnType": "SQLiteBoolean",
            "dataType": "boolean",
            "default": undefined,
            "hasDefault": false,
            "isUnique": false,
            "mode": "boolean",
            "name": "__isDeleted",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___isDeleted_unique",
            "uniqueType": undefined,
          },
          "dataType": "boolean",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "mode": "boolean",
          "name": "__isDeleted",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___isDeleted_unique",
          "uniqueType": undefined,
        },
        "__key": SQLiteText {
          "columnType": "SQLiteText",
          "config": {
            "columnType": "SQLiteText",
            "dataType": "string",
            "default": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "__key",
            "notNull": true,
            "primaryKey": true,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___key_unique",
            "uniqueType": undefined,
          },
          "dataType": "string",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "length": undefined,
          "name": "__key",
          "notNull": true,
          "primary": true,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___key_unique",
          "uniqueType": undefined,
        },
        "__lastUpdatedBlockNumber": SQLiteBigInt {
          "columnType": "SQLiteBigInt",
          "config": {
            "columnType": "SQLiteBigInt",
            "dataType": "bigint",
            "default": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___lastUpdatedBlockNumber_unique",
            "uniqueType": undefined,
          },
          "dataType": "bigint",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "name": "__lastUpdatedBlockNumber",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___lastUpdatedBlockNumber_unique",
          "uniqueType": undefined,
        },
        "addrs": SQLiteCustomColumn {
          "columnType": "SQLiteCustomColumn",
          "config": {
            "columnType": "SQLiteCustomColumn",
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "dataType": "custom",
            "default": undefined,
            "fieldConfig": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "addrs",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_addrs_unique",
            "uniqueType": undefined,
          },
          "dataType": "custom",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "addrs",
          "notNull": true,
          "primary": false,
          "sqlName": "text",
          "table": [Circular],
          "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_addrs_unique",
          "uniqueType": undefined,
        },
        Symbol(drizzle:Name): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users",
        Symbol(drizzle:OriginalName): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users",
        Symbol(drizzle:Schema): undefined,
        Symbol(drizzle:Columns): {
          "__data": SQLiteText {
            "columnType": "SQLiteText",
            "config": {
              "columnType": "SQLiteText",
              "dataType": "string",
              "default": undefined,
              "enumValues": undefined,
              "hasDefault": false,
              "isUnique": false,
              "length": undefined,
              "name": "__data",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___data_unique",
              "uniqueType": undefined,
            },
            "dataType": "string",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "__data",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___data_unique",
            "uniqueType": undefined,
          },
          "__isDeleted": SQLiteBoolean {
            "autoIncrement": false,
            "columnType": "SQLiteBoolean",
            "config": {
              "autoIncrement": false,
              "columnType": "SQLiteBoolean",
              "dataType": "boolean",
              "default": undefined,
              "hasDefault": false,
              "isUnique": false,
              "mode": "boolean",
              "name": "__isDeleted",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___isDeleted_unique",
              "uniqueType": undefined,
            },
            "dataType": "boolean",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "mode": "boolean",
            "name": "__isDeleted",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___isDeleted_unique",
            "uniqueType": undefined,
          },
          "__key": SQLiteText {
            "columnType": "SQLiteText",
            "config": {
              "columnType": "SQLiteText",
              "dataType": "string",
              "default": undefined,
              "enumValues": undefined,
              "hasDefault": false,
              "isUnique": false,
              "length": undefined,
              "name": "__key",
              "notNull": true,
              "primaryKey": true,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___key_unique",
              "uniqueType": undefined,
            },
            "dataType": "string",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "length": undefined,
            "name": "__key",
            "notNull": true,
            "primary": true,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___key_unique",
            "uniqueType": undefined,
          },
          "__lastUpdatedBlockNumber": SQLiteBigInt {
            "columnType": "SQLiteBigInt",
            "config": {
              "columnType": "SQLiteBigInt",
              "dataType": "bigint",
              "default": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "__lastUpdatedBlockNumber",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___lastUpdatedBlockNumber_unique",
              "uniqueType": undefined,
            },
            "dataType": "bigint",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users___lastUpdatedBlockNumber_unique",
            "uniqueType": undefined,
          },
          "addrs": SQLiteCustomColumn {
            "columnType": "SQLiteCustomColumn",
            "config": {
              "columnType": "SQLiteCustomColumn",
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "dataType": "custom",
              "default": undefined,
              "fieldConfig": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "addrs",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_addrs_unique",
              "uniqueType": undefined,
            },
            "dataType": "custom",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "addrs",
            "notNull": true,
            "primary": false,
            "sqlName": "text",
            "table": [Circular],
            "uniqueName": "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users_addrs_unique",
            "uniqueType": undefined,
          },
        },
        Symbol(drizzle:BaseName): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test__users",
        Symbol(drizzle:IsAlias): false,
        Symbol(drizzle:ExtraConfigBuilder): undefined,
        Symbol(drizzle:IsDrizzleTable): true,
        Symbol(drizzle:SQLiteInlineForeignKeys): [],
      }
    `);
  });
});
