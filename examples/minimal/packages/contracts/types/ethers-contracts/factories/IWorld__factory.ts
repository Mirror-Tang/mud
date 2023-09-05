/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Signer, utils } from "ethers";
import type { Provider } from "@ethersproject/providers";
import type { IWorld, IWorldInterface } from "../IWorld";

const _abi = [
  {
    inputs: [
      {
        internalType: "string",
        name: "resource",
        type: "string",
      },
      {
        internalType: "address",
        name: "caller",
        type: "address",
      },
    ],
    name: "AccessDenied",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "delegator",
        type: "address",
      },
      {
        internalType: "address",
        name: "delegatee",
        type: "address",
      },
    ],
    name: "DelegationNotFound",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "functionSelector",
        type: "bytes4",
      },
    ],
    name: "FunctionSelectorExists",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "functionSelector",
        type: "bytes4",
      },
    ],
    name: "FunctionSelectorNotFound",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "resource",
        type: "string",
      },
    ],
    name: "InvalidSelector",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "module",
        type: "string",
      },
    ],
    name: "ModuleAlreadyInstalled",
    type: "error",
  },
  {
    inputs: [],
    name: "MyCustomError",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "resource",
        type: "string",
      },
    ],
    name: "ResourceExists",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "resource",
        type: "string",
      },
    ],
    name: "ResourceNotFound",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "length",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "received",
        type: "uint256",
      },
    ],
    name: "StoreCore_DataIndexOverflow",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "expected",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "received",
        type: "uint256",
      },
    ],
    name: "StoreCore_InvalidDataLength",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "expected",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "received",
        type: "uint256",
      },
    ],
    name: "StoreCore_InvalidKeyNamesLength",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "expected",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "received",
        type: "uint256",
      },
    ],
    name: "StoreCore_InvalidValueNamesLength",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "expected",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "received",
        type: "uint256",
      },
    ],
    name: "StoreCore_InvalidValueSchemaLength",
    type: "error",
  },
  {
    inputs: [],
    name: "StoreCore_NotDynamicField",
    type: "error",
  },
  {
    inputs: [],
    name: "StoreCore_NotImplemented",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "tableId",
        type: "bytes32",
      },
      {
        internalType: "string",
        name: "tableIdString",
        type: "string",
      },
    ],
    name: "StoreCore_TableAlreadyExists",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "tableId",
        type: "bytes32",
      },
      {
        internalType: "string",
        name: "tableIdString",
        type: "string",
      },
    ],
    name: "StoreCore_TableNotFound",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "system",
        type: "address",
      },
    ],
    name: "SystemExists",
    type: "error",
  },
  {
    anonymous: false,
    inputs: [],
    name: "HelloWorld",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        indexed: false,
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
    ],
    name: "StoreDeleteRecord",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        indexed: false,
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        indexed: false,
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
    ],
    name: "StoreEphemeralRecord",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        indexed: false,
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        indexed: false,
        internalType: "uint8",
        name: "schemaIndex",
        type: "uint8",
      },
      {
        indexed: false,
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
    ],
    name: "StoreSetField",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        indexed: false,
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        indexed: false,
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
    ],
    name: "StoreSetRecord",
    type: "event",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "resourceSelector",
        type: "bytes32",
      },
      {
        internalType: "bytes",
        name: "funcSelectorAndArgs",
        type: "bytes",
      },
    ],
    name: "call",
    outputs: [
      {
        internalType: "bytes",
        name: "",
        type: "bytes",
      },
    ],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "delegator",
        type: "address",
      },
      {
        internalType: "bytes32",
        name: "resourceSelector",
        type: "bytes32",
      },
      {
        internalType: "bytes",
        name: "funcSelectorAndArgs",
        type: "bytes",
      },
    ],
    name: "callFrom",
    outputs: [
      {
        internalType: "bytes",
        name: "",
        type: "bytes",
      },
    ],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "deleteRecord",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: "bytes",
            name: "value",
            type: "bytes",
          },
        ],
        internalType: "struct BytesStruct[]",
        name: "",
        type: "tuple[]",
      },
    ],
    name: "dynamicArrayBytesStruct",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: "string",
            name: "value",
            type: "string",
          },
        ],
        internalType: "struct StringStruct[]",
        name: "",
        type: "tuple[]",
      },
    ],
    name: "dynamicArrayStringStruct",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "emitEphemeralRecord",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "uint8",
        name: "schemaIndex",
        type: "uint8",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "getField",
    outputs: [
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
    ],
    name: "getFieldLayout",
    outputs: [
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "uint8",
        name: "schemaIndex",
        type: "uint8",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "getFieldLength",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "uint8",
        name: "schemaIndex",
        type: "uint8",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
      {
        internalType: "uint256",
        name: "start",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "end",
        type: "uint256",
      },
    ],
    name: "getFieldSlice",
    outputs: [
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
    ],
    name: "getKeySchema",
    outputs: [
      {
        internalType: "Schema",
        name: "schema",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "getRecord",
    outputs: [
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
    ],
    name: "getValueSchema",
    outputs: [
      {
        internalType: "Schema",
        name: "schema",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "resourceSelector",
        type: "bytes32",
      },
      {
        internalType: "address",
        name: "grantee",
        type: "address",
      },
    ],
    name: "grantAccess",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "increment",
    outputs: [
      {
        internalType: "uint32",
        name: "",
        type: "uint32",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "contract IModule",
        name: "module",
        type: "address",
      },
      {
        internalType: "bytes",
        name: "args",
        type: "bytes",
      },
    ],
    name: "installModule",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "contract IModule",
        name: "module",
        type: "address",
      },
      {
        internalType: "bytes",
        name: "args",
        type: "bytes",
      },
    ],
    name: "installRootModule",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint32",
        name: "item",
        type: "uint32",
      },
      {
        internalType: "uint32",
        name: "itemVariant",
        type: "uint32",
      },
    ],
    name: "pickUp",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "uint8",
        name: "schemaIndex",
        type: "uint8",
      },
      {
        internalType: "uint256",
        name: "byteLengthToPop",
        type: "uint256",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "popFromField",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "uint8",
        name: "schemaIndex",
        type: "uint8",
      },
      {
        internalType: "bytes",
        name: "dataToPush",
        type: "bytes",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "pushToField",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "delegatee",
        type: "address",
      },
      {
        internalType: "bytes32",
        name: "delegationControlId",
        type: "bytes32",
      },
      {
        internalType: "bytes",
        name: "initFuncSelectorAndArgs",
        type: "bytes",
      },
    ],
    name: "registerDelegation",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "resourceSelector",
        type: "bytes32",
      },
      {
        internalType: "string",
        name: "systemFunctionName",
        type: "string",
      },
      {
        internalType: "string",
        name: "systemFunctionArguments",
        type: "string",
      },
    ],
    name: "registerFunctionSelector",
    outputs: [
      {
        internalType: "bytes4",
        name: "worldFunctionSelector",
        type: "bytes4",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes16",
        name: "namespace",
        type: "bytes16",
      },
    ],
    name: "registerNamespace",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "resourceSelector",
        type: "bytes32",
      },
      {
        internalType: "bytes4",
        name: "worldFunctionSelector",
        type: "bytes4",
      },
      {
        internalType: "bytes4",
        name: "systemFunctionSelector",
        type: "bytes4",
      },
    ],
    name: "registerRootFunctionSelector",
    outputs: [
      {
        internalType: "bytes4",
        name: "",
        type: "bytes4",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "contract IStoreHook",
        name: "hook",
        type: "address",
      },
    ],
    name: "registerStoreHook",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "resourceSelector",
        type: "bytes32",
      },
      {
        internalType: "contract WorldContextConsumer",
        name: "system",
        type: "address",
      },
      {
        internalType: "bool",
        name: "publicAccess",
        type: "bool",
      },
    ],
    name: "registerSystem",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "resourceSelector",
        type: "bytes32",
      },
      {
        internalType: "contract ISystemHook",
        name: "hook",
        type: "address",
      },
    ],
    name: "registerSystemHook",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
      {
        internalType: "Schema",
        name: "keySchema",
        type: "bytes32",
      },
      {
        internalType: "Schema",
        name: "valueSchema",
        type: "bytes32",
      },
      {
        internalType: "string[]",
        name: "keyNames",
        type: "string[]",
      },
      {
        internalType: "string[]",
        name: "fieldNames",
        type: "string[]",
      },
    ],
    name: "registerTable",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "resourceSelector",
        type: "bytes32",
      },
      {
        internalType: "address",
        name: "grantee",
        type: "address",
      },
    ],
    name: "revokeAccess",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "message",
        type: "string",
      },
    ],
    name: "sendMessage",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "uint8",
        name: "schemaIndex",
        type: "uint8",
      },
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "setField",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "setRecord",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: "bytes",
            name: "value",
            type: "bytes",
          },
        ],
        internalType: "struct BytesStruct[1]",
        name: "",
        type: "tuple[1]",
      },
    ],
    name: "staticArrayBytesStruct",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: "string",
            name: "value",
            type: "string",
          },
        ],
        internalType: "struct StringStruct[1]",
        name: "",
        type: "tuple[1]",
      },
    ],
    name: "staticArrayStringStruct",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes16",
        name: "namespace",
        type: "bytes16",
      },
      {
        internalType: "address",
        name: "newOwner",
        type: "address",
      },
    ],
    name: "transferOwnership",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes32",
        name: "table",
        type: "bytes32",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "uint8",
        name: "schemaIndex",
        type: "uint8",
      },
      {
        internalType: "uint256",
        name: "startByteIndex",
        type: "uint256",
      },
      {
        internalType: "bytes",
        name: "dataToSet",
        type: "bytes",
      },
      {
        internalType: "FieldLayout",
        name: "fieldLayout",
        type: "bytes32",
      },
    ],
    name: "updateInField",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "willRevert",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
] as const;

export class IWorld__factory {
  static readonly abi = _abi;
  static createInterface(): IWorldInterface {
    return new utils.Interface(_abi) as IWorldInterface;
  }
  static connect(address: string, signerOrProvider: Signer | Provider): IWorld {
    return new Contract(address, _abi, signerOrProvider) as IWorld;
  }
}
