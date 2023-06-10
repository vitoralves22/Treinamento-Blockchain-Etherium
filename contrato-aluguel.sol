// SPDX-License-Identifier: MIT
// Endereço: 0xfa4f5D455c21EB2BF1232A030d74579805918eb0

pragma solidity 0.8.20;

contract ContratoAluguel {
    string public locador;
    string public locatario;
    uint256[36] public valoresAluguel;

    constructor(string memory _locador, string memory _locatario, uint256 valorInicialAluguel) {
        locador = _locador;
        locatario = _locatario;

        for (uint i = 0; i < 36; i++) {
            valoresAluguel[i] = valorInicialAluguel;
        }
    }

    function valorAluguel(uint256 mes) public view returns (uint256) {
        return valoresAluguel[mes - 1];
    }

    function getNomes() public view returns (string memory, string memory) {
        return (locador, locatario);
    }

    function alteraNome(uint8 tipoPessoa, string memory novoNome) public {
        if (tipoPessoa == 1) {
            locador = novoNome;
        } else if (tipoPessoa == 2) {
            locatario = novoNome;
        }
    }

    function reajustaAluguel(uint256 mesInicio, uint256 valorReajuste) public {
        for (uint i = mesInicio - 1; i < 36; i++) {
            valoresAluguel[i] += valorReajuste;
        }
    }
}
