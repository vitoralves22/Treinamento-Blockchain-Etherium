// SPDX-License-Identifier: MIT
// Endereço: 0x0c3c1a615A4910fe9ce815085f2fE24Cb48a8542

pragma solidity 0.8.20;

contract ContratoAluguel {
    struct Pessoa {
        string nome;
        address endereco;
    }

    Pessoa public locador;
    Pessoa public locatario;
    uint256[36] public valoresAluguel;
    mapping (uint256 => bool) public pagamentos;

    modifier onlyLocador() {
        require(msg.sender == locador.endereco, "Somente o locador pode chamar essa funcao.");
        _;
    }

    constructor(string memory _nomeLocador, string memory _nomeLocatario, address _enderecoLocador, uint256 valorInicialAluguel) {
        locador = Pessoa(_nomeLocador, _enderecoLocador);
        locatario = Pessoa(_nomeLocatario, address(0));

        for (uint i = 0; i < 36; i++) {
            valoresAluguel[i] = valorInicialAluguel;
            pagamentos[i] = false;
        }
    }

    function valorAluguel(uint256 mes) public view returns (uint256) {
        require(mes > 0 && mes <= 36, "Mes invalido.");
        return valoresAluguel[mes - 1];
    }

    function getNomes() public view returns (string memory, string memory) {
        return (locador.nome, locatario.nome);
    }

    function alteraNome(uint8 tipoPessoa, string memory novoNome) public onlyLocador {
        require(tipoPessoa == 1 || tipoPessoa == 2, "Tipo de pessoa invalido.");

        if (tipoPessoa == 1) {
            locador.nome = novoNome;
        } else if (tipoPessoa == 2) {
            locatario.nome = novoNome;
        }
    }

    function reajustaAluguel(uint256 mesInicio, uint256 valorReajuste) public onlyLocador {
        require(mesInicio > 0 && mesInicio <= 36, "Mes de inicio invalido.");

        for (uint i = mesInicio - 1; i < 36; i++) {
            valoresAluguel[i] += valorReajuste;
        }
    }

    function pagarAluguel(uint256 mes) public {
        require(!pagamentos[mes - 1], "Aluguel deste mes ja foi pago.");
        pagamentos[mes - 1] = true;
    }

    function verificarPagamento(uint256 mes) public view returns (bool) {
        return pagamentos[mes - 1];
    }
}
