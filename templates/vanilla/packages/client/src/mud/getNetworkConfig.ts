/* Network specific configuration for the client.
 * By default connect to the anvil test network.
 *
 */

/*
 * By default the template just creates a temporary wallet
 * (called a burner wallet) and uses a faucet (on our test net)
 * to get ETH for it.
 *
 * See https://mud.dev/tutorials/minimal/deploy#wallet-managed-address
 * for how to use the user's own address instead.
 */
import { getBurnerPrivateKey } from "@latticexyz/common";

/*
 * Import the addresses of the World, possibly on multiple chains,
 * from packages/contracts/worlds.json. When the contracts package
 * deploys a new `World`, it updates this file.
 */
import worldsJson from "contracts/worlds.json";

/*
 * The supported chains.
 * By default, there are only two chains here:
 *
 * - mudFoundry, the chain running on anvil that pnpm dev
 *   starts by default. It is similar to the viem anvil chain
 *   (see https://viem.sh/docs/clients/test.html), but with the
 *   basefee set to zero to avoid transaction fees.
 * - latticeTestnet, our public test network.
 *
 * See https://mud.dev/tutorials/minimal/deploy#run-the-user-interface
 * for instructions on how to add networks.
 */
import { supportedChains } from "./supportedChains";

/* Process the list of deployed worlds.
 *
 * For every chainID we either have nothing
 * (https://www.typescriptlang.org/docs/handbook/utility-types.html#partialtype)
 * or a record with the World address and optionally the blockNumber
 * in which it was deployed
 * (https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type).
 */
const worlds = worldsJson as Partial<Record<string, { address: string; blockNumber?: number }>>;

/* This is the function that does the actual work. */
export async function getNetworkConfig() {
  /*
   * Read the query sting parameters
   * (https://en.wikipedia.org/wiki/Query_string).
   */
  const params = new URLSearchParams(window.location.search);

  /*
   * The chain ID is the first item available from this list:
   * 1. chainId query parameter
   * 2. chainid query parameter
   * 3. The VITE_CHAIN_ID environment variable set when the
   *    vite dev server was started or client was built
   * 4. The default, 31337 (anvil)
   */
  const chainId = Number(params.get("chainId") || params.get("chainid") || import.meta.env.VITE_CHAIN_ID || 31337);

  /* Find the chain (unless it isn't in the list of supported chains). */
  const chainIndex = supportedChains.findIndex((c) => c.id === chainId);
  const chain = supportedChains[chainIndex];
  if (!chain) {
    throw new Error(`Chain ${chainId} not found`);
  }

  /*
   * Get the address of the World. If you want to use a
   * different address than the one in worlds.json,
   * provide it as worldAddress in the query string.
   */
  const world = worlds[chain.id.toString()];
  const worldAddress = params.get("worldAddress") || world?.address;
  if (!worldAddress) {
    throw new Error(`No world address found for chain ${chainId}. Did you run \`mud deploy\`?`);
  }

  /*
   * MUD clients use events to synchronize the database, meaning
   * they need to look as far back as when the World was started.
   * The block number for the World start can be specified either
   * on the URL (as initialBlockNumber) or in the worlds.json
   * file. If neither has it, it starts at the first block, zero.
   */
  const initialBlockNumber = params.has("initialBlockNumber")
    ? Number(params.get("initialBlockNumber"))
    : world?.blockNumber ?? 0n;

  return {
    privateKey: getBurnerPrivateKey(),
    chainId,
    chain,
    faucetServiceUrl: params.get("faucet") ?? chain.faucetUrl,
    worldAddress,
    initialBlockNumber,
  };
}
