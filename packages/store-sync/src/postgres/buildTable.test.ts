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
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "__data",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "__data",
          "notNull": true,
          "primary": false,
          "sqlName": "bytea",
          "table": [Circular],
        },
        "__isDeleted": PgBoolean {
          "config": {
            "default": undefined,
            "name": "__isDeleted",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "name": "__isDeleted",
          "notNull": true,
          "primary": false,
          "table": [Circular],
        },
        "__key": PgCustomColumn {
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "__key",
            "notNull": true,
            "primaryKey": true,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "__key",
          "notNull": true,
          "primary": true,
          "sqlName": "bytea",
          "table": [Circular],
        },
        "__lastUpdatedBlockNumber": PgCustomColumn {
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "__lastUpdatedBlockNumber",
          "notNull": true,
          "primary": false,
          "sqlName": "numeric",
          "table": [Circular],
        },
        "addr": PgCustomColumn {
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "addr",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "addr",
          "notNull": true,
          "primary": false,
          "sqlName": "bytea",
          "table": [Circular],
        },
        "name": PgText {
          "config": {
            "default": undefined,
            "enumValues": [],
            "name": "name",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "enumValues": [],
          "hasDefault": undefined,
          "name": "name",
          "notNull": true,
          "primary": false,
          "table": [Circular],
        },
        "x": PgCustomColumn {
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "x",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "x",
          "notNull": true,
          "primary": false,
          "sqlName": "integer",
          "table": [Circular],
        },
        "y": PgCustomColumn {
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "y",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "y",
          "notNull": true,
          "primary": false,
          "sqlName": "integer",
          "table": [Circular],
        },
        Symbol(drizzle:Name): "users",
        Symbol(drizzle:OriginalName): "users",
        Symbol(drizzle:Schema): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test",
        Symbol(drizzle:Columns): {
          "__data": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "__data",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "__data",
            "notNull": true,
            "primary": false,
            "sqlName": "bytea",
            "table": [Circular],
          },
          "__isDeleted": PgBoolean {
            "config": {
              "default": undefined,
              "name": "__isDeleted",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "name": "__isDeleted",
            "notNull": true,
            "primary": false,
            "table": [Circular],
          },
          "__key": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "__key",
              "notNull": true,
              "primaryKey": true,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "__key",
            "notNull": true,
            "primary": true,
            "sqlName": "bytea",
            "table": [Circular],
          },
          "__lastUpdatedBlockNumber": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "__lastUpdatedBlockNumber",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primary": false,
            "sqlName": "numeric",
            "table": [Circular],
          },
          "addr": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "addr",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "addr",
            "notNull": true,
            "primary": false,
            "sqlName": "bytea",
            "table": [Circular],
          },
          "name": PgText {
            "config": {
              "default": undefined,
              "enumValues": [],
              "name": "name",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "enumValues": [],
            "hasDefault": undefined,
            "name": "name",
            "notNull": true,
            "primary": false,
            "table": [Circular],
          },
          "x": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "x",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "x",
            "notNull": true,
            "primary": false,
            "sqlName": "integer",
            "table": [Circular],
          },
          "y": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "y",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "y",
            "notNull": true,
            "primary": false,
            "sqlName": "integer",
            "table": [Circular],
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
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "__data",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "__data",
          "notNull": true,
          "primary": false,
          "sqlName": "bytea",
          "table": [Circular],
        },
        "__isDeleted": PgBoolean {
          "config": {
            "default": undefined,
            "name": "__isDeleted",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "name": "__isDeleted",
          "notNull": true,
          "primary": false,
          "table": [Circular],
        },
        "__key": PgCustomColumn {
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "__key",
            "notNull": true,
            "primaryKey": true,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "__key",
          "notNull": true,
          "primary": true,
          "sqlName": "bytea",
          "table": [Circular],
        },
        "__lastUpdatedBlockNumber": PgCustomColumn {
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "__lastUpdatedBlockNumber",
          "notNull": true,
          "primary": false,
          "sqlName": "numeric",
          "table": [Circular],
        },
        "addrs": PgCustomColumn {
          "config": {
            "customTypeParams": {
              "dataType": [Function],
              "fromDriver": [Function],
              "toDriver": [Function],
            },
            "default": undefined,
            "fieldConfig": undefined,
            "name": "addrs",
            "notNull": true,
            "primaryKey": false,
          },
          "default": undefined,
          "hasDefault": undefined,
          "mapFrom": [Function],
          "mapTo": [Function],
          "name": "addrs",
          "notNull": true,
          "primary": false,
          "sqlName": "text",
          "table": [Circular],
        },
        Symbol(drizzle:Name): "users",
        Symbol(drizzle:OriginalName): "users",
        Symbol(drizzle:Schema): "0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF__test",
        Symbol(drizzle:Columns): {
          "__data": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "__data",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "__data",
            "notNull": true,
            "primary": false,
            "sqlName": "bytea",
            "table": [Circular],
          },
          "__isDeleted": PgBoolean {
            "config": {
              "default": undefined,
              "name": "__isDeleted",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "name": "__isDeleted",
            "notNull": true,
            "primary": false,
            "table": [Circular],
          },
          "__key": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "__key",
              "notNull": true,
              "primaryKey": true,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "__key",
            "notNull": true,
            "primary": true,
            "sqlName": "bytea",
            "table": [Circular],
          },
          "__lastUpdatedBlockNumber": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "__lastUpdatedBlockNumber",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "__lastUpdatedBlockNumber",
            "notNull": true,
            "primary": false,
            "sqlName": "numeric",
            "table": [Circular],
          },
          "addrs": PgCustomColumn {
            "config": {
              "customTypeParams": {
                "dataType": [Function],
                "fromDriver": [Function],
                "toDriver": [Function],
              },
              "default": undefined,
              "fieldConfig": undefined,
              "name": "addrs",
              "notNull": true,
              "primaryKey": false,
            },
            "default": undefined,
            "hasDefault": undefined,
            "mapFrom": [Function],
            "mapTo": [Function],
            "name": "addrs",
            "notNull": true,
            "primary": false,
            "sqlName": "text",
            "table": [Circular],
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
