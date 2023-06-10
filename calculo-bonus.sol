// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract CalculoBonusVendedor {
    // Endereço 0xBde6f445B0eAd01a1B6766DF5905B9E7881dA31c
    // Variáveis públicas
    string public nomeVendedor;
    uint256 public fatorBonus;
    
    // Função para definir as variáveis
    function setDados(string memory _nomeVendedor, uint256 _fatorBonus) public {
        nomeVendedor = _nomeVendedor;
        fatorBonus = _fatorBonus;
    }
    
    // Função que calcula o bônus do vendedor
    function calcularBonus(uint256 valorVenda) public view returns (uint256) {
        uint256 bonus = valorVenda * fatorBonus / 100;
        return bonus;
    }
}
