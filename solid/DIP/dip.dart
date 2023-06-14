// DIP - Depender de abstrações e não de classes concretas.

abstract class IContaCorrenteRepository {
  void save();
}

class ContaCorrenteRepositoryImp implements IContaCorrenteRepository {
  @override
  void save() => print("Implementação!");
}

class ContaCorrenteRepositoryMock implements IContaCorrenteRepository {
  @override
  void save() => print("Mock!");
}

class ContaCorrente3 {
  IContaCorrenteRepository? _repository;
  ContaCorrente3(IContaCorrenteRepository repository) {
    _repository = repository;
  }

  void executarAlgumaLogica() {
    _repository!.save();
  }
}

main() {
  ContaCorrente3 c = ContaCorrente3(ContaCorrenteRepositoryImp());
  c.executarAlgumaLogica();
  c = ContaCorrente3(ContaCorrenteRepositoryMock());
}
