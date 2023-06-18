// ISP - Muitas interfaces especificas são melhores que uma geral.

abstract class Conta {
  void depositar(int value);
  void transferir(int value);
  void realizarEmprestimo(int value);
}

class ContaCorrente implements Conta {
  @override
  void depositar(int val) => print("Realizando deposito CC...");
  void transferir(int value) => print("Realizando Transferência CC ....");
  void realizarEmprestimo(int value) => print("Realizando Emprestimo CC ....");
}

class ContaPoupanca implements Conta {
  @override
  void depositar(int val) => print("Realizando deposito CP...");
  void transferir(int value) =>
      throw Exception("Conta poupança não faz transferencia.");
  void realizarEmprestimo(int value) =>
      throw Exception("Conta poupança não faz emprestimo.");
}

main() {
  Conta contaBancaria = ContaCorrente();
  contaBancaria.realizarEmprestimo(1000);
  contaBancaria = ContaPoupanca(); // substituição de liskov
  contaBancaria.realizarEmprestimo(1000);
}

/* 
Já vimos esse exemplo no principio anterior, e para resolver aplicaremos o que
prega no ISP. O problema que encontramos aqui é o engessamento que a classe Con-
ta está nos causando, ela nos oferece mais coisas do que precisamos e somos obr-
igados a implementá-las.

Solução: Quebrar nosso contrato genérico em contratos especializados.

*/

abstract class Conta2 {
  void depositar(int value);
}

abstract class CestaDeServicos {
  void transferir(int value);
  void realizarEmprestimo(int value);
}

class ContaCorrente2 extends Conta2 implements CestaDeServicos {
  @override
  void depositar(int value) => print("Depositando...");
  @override
  void transferir(int value) => print("Transferindo...");
  @override
  void realizarEmprestimo(int value) => print("Realizando empréstimo...");
}

class ContaPoupanca2 extends Conta2 {
  @override
  void depositar(int value) => print("Depositando...");
}

// Dessa forma segregamos nossa interface, então não precisamos mais retornar uma exception ou implementar um método que pouco faz sentido para o nosso uso //
