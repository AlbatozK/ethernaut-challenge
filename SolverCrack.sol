// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SolverCrack{
    /*
    //https://docs.soliditylang.org/en/v0.8.10/assembly.html
    // https://www.ethervm.io/

    // Full testing Contract
    function whatIsTheMeaningOfLife() pure external returns(uint){
        assembly { 
            mstore(0x00, 0x2a)
            return(0x00, 0x20)
        }
    }

    // FROM DEBUG
    076 PUSH1 2a
    078 PUSH1 00
    080 MSTORE
    081 PUSH1 20
    083 PUSH1 00
    085 RETURN

    // BYTECODE - OPCODE
    0x60	PUSH1
    0x52    MSTORE
    0xF3	RETURN

    0x602a - 2
    0x6000 - 2
    0x52   - 1
    0x6020 - 2
    0x6000 - 2
    0xF3   - 1
    ======== 10 bytes => 0x0a
    32 - 10 bytes = 22 bytes => 0x16
    ========
    0x602a60005260206000f3 with 22 bytes prepadding
    */

    constructor() public{
        assembly{
            // Store 42 to mem position 0
            mstore(0x00, 0x602a60005260206000f3)
            // return mem position 0
            return(0x16, 0x0a)
        }
    }
}
