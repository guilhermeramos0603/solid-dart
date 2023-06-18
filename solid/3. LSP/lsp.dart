// LSP - Os subtipos devem ser substituíveis pelos seus tipos base

class Conta {
  void depositar(int value) => print("Depositando ....");
  void transferir(int value) => print("Transferindo ....");
  void realizarEmprestimo(int value) => print("Realizando Emprestimo ....");
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
Percebemos aqui então que temos nossa classe pai com suas duas implementações, porem elas infrigem o
principio de substituição de liskov, pois conta poupança tem dois metodos inutilizaveis que so retornam
exceptions e mesmo assim ela é obrigada a instanciar.

Solução: Podemos ver até aqui que um problema do Solid vai corrigindo o outro, quando voce fecha sua classe
para alteraçoes voce automaticamente quebra ela e diminui sua responsabilidade, não é diferente aqui.

Para resolver esse problema podemos usar o nosso próximo principio de segregação de interfaces, que irá solu-
cionar nosso problema, vamos para ele.
*/