import { describe, it, expect } from "vitest";
import { buildTable } from "./buildTable";

describe("buildTable", () => {
  it("should create table from schema", async () => {
    const table = buildTable({
      address: "0xffffffffffffffffffffffffffffffffffffffff",
      namespace: "test",
      name: "users",
      keySchema: { x: "uint32", y: "uint32" },
      valueSchema: { name: "string", addr: "address" },
    });

    expect(table).toMatchInlineSnapshot(`
      PgTable {
        "__data": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "name": "__data",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users___data_unique",
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
          "name": "__data",
          "notNull": true,
          "primary": false,
          "sqlName": "bytea",
          "table": [Circular],
          "uniqueName": "users___data_unique",
          "uniqueType": undefined,
        },
        "__isDeleted": PgBoolean {
          "columnType": "PgBoolean",
          "config": {
            "columnType": "PgBoolean",
            "dataType": "boolean",
            "default": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "__isDeleted",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users___isDeleted_unique",
            "uniqueType": undefined,
          },
          "dataType": "boolean",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "name": "__isDeleted",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "users___isDeleted_unique",
          "uniqueType": undefined,
        },
        "__key": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "name": "__key",
            "notNull": true,
            "primaryKey": true,
            "uniqueName": "users___key_unique",
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
          "name": "__key",
          "notNull": true,
          "primary": true,
          "sqlName": "bytea",
          "table": [Circular],
          "uniqueName": "users___key_unique",
          "uniqueType": undefined,
        },
        "__lastUpdatedBlockNumber": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users___lastUpdatedBlockNumber_unique",
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
          "name": "__lastUpdatedBlockNumber",
          "notNull": true,
          "primary": false,
          "sqlName": "numeric",
          "table": [Circular],
          "uniqueName": "users___lastUpdatedBlockNumber_unique",
          "uniqueType": undefined,
        },
        "addr": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "uniqueName": "users_addr_unique",
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
          "sqlName": "bytea",
          "table": [Circular],
          "uniqueName": "users_addr_unique",
          "uniqueType": undefined,
        },
        "name": PgText {
          "columnType": "PgText",
          "config": {
            "columnType": "PgText",
            "dataType": "string",
            "default": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "name",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users_name_unique",
            "uniqueType": undefined,
          },
          "dataType": "string",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "name": "name",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "users_name_unique",
          "uniqueType": undefined,
        },
        "x": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "name": "x",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users_x_unique",
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
          "name": "x",
          "notNull": true,
          "primary": false,
          "sqlName": "integer",
          "table": [Circular],
          "uniqueName": "users_x_unique",
          "uniqueType": undefined,
        },
        "y": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "name": "y",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users_y_unique",
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
          "name": "y",
          "notNull": true,
          "primary": false,
          "sqlName": "integer",
          "table": [Circular],
          "uniqueName": "users_y_unique",
          "uniqueType": undefined,
        },
        Symbol(drizzle:Name): "users",
        Symbol(drizzle:OriginalName): "users",
        Symbol(drizzle:Schema): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test",
        Symbol(drizzle:Columns): {
          "__data": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "name": "__data",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users___data_unique",
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
            "name": "__data",
            "notNull": true,
            "primary": false,
            "sqlName": "bytea",
            "table": [Circular],
            "uniqueName": "users___data_unique",
            "uniqueType": undefined,
          },
          "__isDeleted": PgBoolean {
            "columnType": "PgBoolean",
            "config": {
              "columnType": "PgBoolean",
              "dataType": "boolean",
              "default": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "__isDeleted",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users___isDeleted_unique",
              "uniqueType": undefined,
            },
            "dataType": "boolean",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "__isDeleted",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "users___isDeleted_unique",
            "uniqueType": undefined,
          },
          "__key": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "name": "__key",
              "notNull": true,
              "primaryKey": true,
              "uniqueName": "users___key_unique",
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
            "name": "__key",
            "notNull": true,
            "primary": true,
            "sqlName": "bytea",
            "table": [Circular],
            "uniqueName": "users___key_unique",
            "uniqueType": undefined,
          },
          "__lastUpdatedBlockNumber": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "name": "__lastUpdatedBlockNumber",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users___lastUpdatedBlockNumber_unique",
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
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primary": false,
            "sqlName": "numeric",
            "table": [Circular],
            "uniqueName": "users___lastUpdatedBlockNumber_unique",
            "uniqueType": undefined,
          },
          "addr": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "uniqueName": "users_addr_unique",
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
            "sqlName": "bytea",
            "table": [Circular],
            "uniqueName": "users_addr_unique",
            "uniqueType": undefined,
          },
          "name": PgText {
            "columnType": "PgText",
            "config": {
              "columnType": "PgText",
              "dataType": "string",
              "default": undefined,
              "enumValues": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "name",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users_name_unique",
              "uniqueType": undefined,
            },
            "dataType": "string",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "name",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "users_name_unique",
            "uniqueType": undefined,
          },
          "x": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "name": "x",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users_x_unique",
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
            "name": "x",
            "notNull": true,
            "primary": false,
            "sqlName": "integer",
            "table": [Circular],
            "uniqueName": "users_x_unique",
            "uniqueType": undefined,
          },
          "y": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "name": "y",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users_y_unique",
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
            "name": "y",
            "notNull": true,
            "primary": false,
            "sqlName": "integer",
            "table": [Circular],
            "uniqueName": "users_y_unique",
            "uniqueType": undefined,
          },
        },
        Symbol(drizzle:BaseName): "users",
        Symbol(drizzle:IsAlias): false,
        Symbol(drizzle:ExtraConfigBuilder): undefined,
        Symbol(drizzle:IsDrizzleTable): true,
        Symbol(drizzle:PgInlineForeignKeys): [],
      }
    `);
  });

  it("can create a singleton table", async () => {
    const table = buildTable({
      address: "0xffffffffffffffffffffffffffffffffffffffff",
      namespace: "test",
      name: "users",
      keySchema: {},
      valueSchema: { addrs: "address[]" },
    });

    expect(table).toMatchInlineSnapshot(`
      PgTable {
        "__data": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "name": "__data",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users___data_unique",
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
          "name": "__data",
          "notNull": true,
          "primary": false,
          "sqlName": "bytea",
          "table": [Circular],
          "uniqueName": "users___data_unique",
          "uniqueType": undefined,
        },
        "__isDeleted": PgBoolean {
          "columnType": "PgBoolean",
          "config": {
            "columnType": "PgBoolean",
            "dataType": "boolean",
            "default": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "__isDeleted",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users___isDeleted_unique",
            "uniqueType": undefined,
          },
          "dataType": "boolean",
          "default": undefined,
          "defaultFn": undefined,
          "enumValues": undefined,
          "hasDefault": false,
          "isUnique": false,
          "name": "__isDeleted",
          "notNull": true,
          "primary": false,
          "table": [Circular],
          "uniqueName": "users___isDeleted_unique",
          "uniqueType": undefined,
        },
        "__key": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "name": "__key",
            "notNull": true,
            "primaryKey": true,
            "uniqueName": "users___key_unique",
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
          "name": "__key",
          "notNull": true,
          "primary": true,
          "sqlName": "bytea",
          "table": [Circular],
          "uniqueName": "users___key_unique",
          "uniqueType": undefined,
        },
        "__lastUpdatedBlockNumber": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primaryKey": false,
            "uniqueName": "users___lastUpdatedBlockNumber_unique",
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
          "name": "__lastUpdatedBlockNumber",
          "notNull": true,
          "primary": false,
          "sqlName": "numeric",
          "table": [Circular],
          "uniqueName": "users___lastUpdatedBlockNumber_unique",
          "uniqueType": undefined,
        },
        "addrs": PgCustomColumn {
          "columnType": "PgCustomColumn",
          "config": {
            "columnType": "PgCustomColumn",
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
            "uniqueName": "users_addrs_unique",
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
          "uniqueName": "users_addrs_unique",
          "uniqueType": undefined,
        },
        Symbol(drizzle:Name): "users",
        Symbol(drizzle:OriginalName): "users",
        Symbol(drizzle:Schema): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test",
        Symbol(drizzle:Columns): {
          "__data": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "name": "__data",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users___data_unique",
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
            "name": "__data",
            "notNull": true,
            "primary": false,
            "sqlName": "bytea",
            "table": [Circular],
            "uniqueName": "users___data_unique",
            "uniqueType": undefined,
          },
          "__isDeleted": PgBoolean {
            "columnType": "PgBoolean",
            "config": {
              "columnType": "PgBoolean",
              "dataType": "boolean",
              "default": undefined,
              "hasDefault": false,
              "isUnique": false,
              "name": "__isDeleted",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users___isDeleted_unique",
              "uniqueType": undefined,
            },
            "dataType": "boolean",
            "default": undefined,
            "defaultFn": undefined,
            "enumValues": undefined,
            "hasDefault": false,
            "isUnique": false,
            "name": "__isDeleted",
            "notNull": true,
            "primary": false,
            "table": [Circular],
            "uniqueName": "users___isDeleted_unique",
            "uniqueType": undefined,
          },
          "__key": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "name": "__key",
              "notNull": true,
              "primaryKey": true,
              "uniqueName": "users___key_unique",
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
            "name": "__key",
            "notNull": true,
            "primary": true,
            "sqlName": "bytea",
            "table": [Circular],
            "uniqueName": "users___key_unique",
            "uniqueType": undefined,
          },
          "__lastUpdatedBlockNumber": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "name": "__lastUpdatedBlockNumber",
              "notNull": true,
              "primaryKey": false,
              "uniqueName": "users___lastUpdatedBlockNumber_unique",
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
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primary": false,
            "sqlName": "numeric",
            "table": [Circular],
            "uniqueName": "users___lastUpdatedBlockNumber_unique",
            "uniqueType": undefined,
          },
          "addrs": PgCustomColumn {
            "columnType": "PgCustomColumn",
            "config": {
              "columnType": "PgCustomColumn",
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
              "uniqueName": "users_addrs_unique",
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
            "uniqueName": "users_addrs_unique",
            "uniqueType": undefined,
          },
        },
        Symbol(drizzle:BaseName): "users",
        Symbol(drizzle:IsAlias): false,
        Symbol(drizzle:ExtraConfigBuilder): undefined,
        Symbol(drizzle:IsDrizzleTable): true,
        Symbol(drizzle:PgInlineForeignKeys): [],
      }
    `);
  });
});
