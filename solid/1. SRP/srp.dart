// SRP

// Uma classedeve ter apenas um motivo para mudar
// Sua responsabilidade é sempre em cima de um e apenas um ator.
class ContaCorrente {
  validarContaExiste() {
    print("Lógica do negócio");
  }

  create() {
    print("Salva no banco de daods");
  }
}

/*
 Solução: Devemos separar cada reponsabildade para sua regra de negocio 
 crucial um objeto não pode e deve fazer mais do que é o dominio dele.
 
 Lembre-se: sua funcionalidade não importa a granularidade(pacote/modulo/classe/me
 todo/função) não deve fazer o que não é proposto, normalmente um funcionario não deve
 ser capaz de adicionar um produto em seu dominio, um produto não deve ser capaz de 
 exercer controle sobre o banco de dadso, um pacote que diz que faz A não deve fazer
 B.
 */

class ContaCorrenteRepository {
  void save() => print("Salva no banco!");
}

class ContaCorrente2 {
  final ContaCorrenteRepository _repository = ContaCorrenteRepository();

  validarContaExiste() {
    print("Lógica do negócio");
  }

  create() {
    _repository.save();
  }
}

/*
 O código dessa forma resolve nosso problema coma responsabilidade unica, mas acabamos
 infringindo o principio da inversão de dependencias. Na nossa função acima, a nossa
 classe ContaCorrente depende de repository para funcionar corretamente,pois repository
 não é um contrato, impossibilitando testes de unidade, caso desejamos alterar algo 
 no repo teremos que alterar conta corrente, o que fere também o principio de OpenClosed
 e pela falta de um contrato também nao temos a substituiçao de liskov.
 
 Solução: vamos inverter a responsabilidade, deixar que quem chamar a ContaCorrente
 resolva a dependencia do repo. Acopanhe no arquivo DIP.
 */
