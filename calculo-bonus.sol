// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract CalculoBonusVendedor {
    // Endereço 0xDeCb1d2F2f98E64706609f920e4380aD9D614bb5
    // Variáveis públicas
    string public nomeVendedor;
    uint256 public fatorBonus;
    uint256 public valorVenda;
    
    // Função para definir as variáveis
    function setDados(string memory _nomeVendedor, uint256 _valorVenda, uint256 _fatorBonus) public {
        nomeVendedor = _nomeVendedor;
        valorVenda = _valorVenda;
        fatorBonus = _fatorBonus;
    }
    
    // Função que calcula o bônus do vendedor
    function calcularBonus() public view returns (uint256) {
        uint256 bonus = valorVenda * fatorBonus / 100;
        return bonus;
    }

}
