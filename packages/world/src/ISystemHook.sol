// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { IERC165, ERC165_INTERFACE_ID } from "./IERC165.sol";
import { ResourceId } from "./WorldResourceId.sol";

// ERC-165 Interface ID (see https://eips.ethereum.org/EIPS/eip-165)
bytes4 constant SYSTEM_HOOK_INTERFACE_ID = ISystemHook.onBeforeCallSystem.selector ^
  ISystemHook.onAfterCallSystem.selector ^
  ERC165_INTERFACE_ID;

interface ISystemHook is IERC165 {
  function onBeforeCallSystem(address msgSender, ResourceId systemId, bytes memory callData) external;

  function onAfterCallSystem(address msgSender, ResourceId systemId, bytes memory callData) external;
}
