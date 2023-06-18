// OCP nos informa que devemos ser capazes de extender um comportamento de classe, sem modificalos

class Pagamento {
  void pagarBoleto() => print("Pagando Boleto!");
  void pagarImposto() => print("Pagando Imposto!");
}

/* 
E se precisarmos adicionar um novo tipo de pagamento? desta forma estamos sujeitos a modificar nosso codigoa
ja em produção.
Esta alteração ira gerar um novo binario para lugares onde não necessita deste novo meio de pagento.


Solução: Como solução devemos ser capazes de extender o fucnionamento da nossa classe de pagemtno ou seja
"pagar", porêm sem modificar as classes existentes.
 */

abstract class Pagamento2 {
  int valor = 20;

  void pagar();
}

//na extensão reutilizamos o valor.

class PagamentoBoleto extends Pagamento2 {
  @override
  void pagar() => print("Pagando boleto! ... $valor");
}

// na herança re-implementamos o valor.
class PagamentoImposto implements Pagamento2 {
  @override
  int valor = 10;

  @override
  void pagar() => print("Pagando imposto! ... $valor");
}

// nova forma de pagamento.
class PagamentoCartao extends Pagamento2 {
  @override
  void pagar() => print("Pagando cartão! ... $valor");
}


/* 
Se meu PO decide que implementaremos uma nova forma de pagamento, pix, no nosso aplicativo
eu simplesmente crio outra class extendendo e colocando seus casos de uso, e as outras ficarão intactas.
 */



