declare const abi: [
  {
    inputs: [];
    name: "NonRootInstallNotSupported";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "string";
        name: "resourceSelector";
        type: "string";
      }
    ];
    name: "RequiredModuleNotFound";
    type: "error";
  },
  {
    inputs: [];
    name: "RootInstallModeNotSupported";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "uint256";
        name: "length";
        type: "uint256";
      }
    ];
    name: "SchemaLib_InvalidLength";
    type: "error";
  },
  {
    inputs: [];
    name: "SchemaLib_StaticTypeAfterDynamicType";
    type: "error";
  },
  {
    inputs: [];
    name: "getName";
    outputs: [
      {
        internalType: "bytes16";
        name: "";
        type: "bytes16";
      }
    ];
    stateMutability: "pure";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes";
        name: "";
        type: "bytes";
      }
    ];
    name: "install";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes";
        name: "args";
        type: "bytes";
      }
    ];
    name: "installRoot";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  }
];
export default abi;
