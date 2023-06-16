// SPDX-License-Identifier: MIT
// Endereço: 0xd9145CCE52D386f254917e481eB44e9943F39138

pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract VitorToken is ERC20, ERC20Burnable {
    constructor(uint256 initialSupply) ERC20("VitorToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
