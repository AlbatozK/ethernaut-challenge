// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ForceEther{

    receive() external payable{}

    function forceTransfer(address payable _contract) external{ 
        selfdestruct(_contract);
    }
    function withdraw() external payable{
        msg.sender.transfer(address(this).balance);
    }
}
