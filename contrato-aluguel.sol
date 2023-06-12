// SPDX-License-Identifier: MIT
// Endereço: 0x6BC75980e4cB50604DB05E369e1AeC66774c5dC2

pragma solidity 0.8.20;

contract ContratoAluguel {
    struct Pessoa {
        string nome;
    }

    Pessoa public locador;
    Pessoa public locatario;
    uint256[36] public valoresAluguel;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Somente o proprietario pode chamar essa funcao.");
        _;
    }

    constructor(string memory _nomeLocador, string memory _nomeLocatario, uint256 valorInicialAluguel) {
        locador = Pessoa(_nomeLocador);
        locatario = Pessoa(_nomeLocatario);
        owner = msg.sender;

        for (uint i = 0; i < 36; i++) {
            valoresAluguel[i] = valorInicialAluguel;
        }
    }

    function valorAluguel(uint256 mes) public view returns (uint256) {
        require(mes > 0 && mes <= 36, "Mes invalido.");
        return valoresAluguel[mes - 1];
    }

    function getNomes() public view returns (string memory, string memory) {
        return (locador.nome, locatario.nome);
    }

    function alteraNome(uint8 tipoPessoa, string memory novoNome) public onlyOwner {
        require(tipoPessoa == 1 || tipoPessoa == 2, "Tipo de pessoa invalido.");

        if (tipoPessoa == 1) {
            locador.nome = novoNome;
        } else if (tipoPessoa == 2) {
            locatario.nome = novoNome;
        }
    }

    function reajustaAluguel(uint256 mesInicio, uint256 valorReajuste) public onlyOwner {
        require(mesInicio > 0 && mesInicio <= 36, "Mes de inicio invalido.");

        for (uint i = mesInicio - 1; i < 36; i++) {
            valoresAluguel[i] += valorReajuste;
        }
    }
}
