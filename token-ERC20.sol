// SPDX-License-Identifier: MIT
// Endereço: 0x04524B8FfC78d5c89Fa8D182d0C49dC0edB8BAc6

pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MyToken is ERC20, ERC20Burnable {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
