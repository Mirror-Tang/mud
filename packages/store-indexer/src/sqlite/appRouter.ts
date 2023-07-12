import { publicProcedure, router } from "../trpc";
import { z } from "zod";
import { Hex } from "viem";
import { getDatabase, getTables } from "./sqlite";
import { TableWithRows } from "../common";
import { createSqliteTable } from "./createSqliteTable";
import { bigIntMax } from "@latticexyz/common/utils";

export const appRouter = router({
  findAll: publicProcedure
    .input(
      z.object({
        chainId: z.number(),
        address: z.string(), // TODO: refine to hex
      })
    )
    .query(async (opts): Promise<{ blockNumber: bigint; tables: TableWithRows[] }> => {
      const { chainId, address } = opts.input;

      const db = await getDatabase(chainId, address as Hex);
      const tables = await getTables(db);

      const tablesWithRows = await Promise.all(
        tables.map(async (table) => {
          const { tableName, table: sqliteTable } = createSqliteTable(table);
          const rows = db.select().from(sqliteTable).all();
          // console.log("got rows for table", tableName, rows);
          return {
            ...table,
            rows: rows.map((row) => ({
              keyTuple: Object.fromEntries(Object.entries(table.keyTupleSchema).map(([name]) => [name, row[name]])),
              value: Object.fromEntries(Object.entries(table.valueSchema).map(([name]) => [name, row[name]])),
            })),
          };
        })
      );

      // TODO: store this in global table
      const lastBlockNumber = tablesWithRows.reduce(
        (blockNumber, table) => bigIntMax(blockNumber, table.lastBlockNumber ?? -1n),
        -1n
      );

      const result = {
        blockNumber: lastBlockNumber,
        tables: tablesWithRows,
      };

      // console.log("findAll:", opts, result);

      return result;
    }),
});

export type AppRouter = typeof appRouter;