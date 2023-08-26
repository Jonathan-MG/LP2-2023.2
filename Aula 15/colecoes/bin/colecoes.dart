// void main() {
  // // Listas
  // var nomes = <String>[];
  // var nomes = ['Ana', 'Pedro']; //ArrayList
  // List<String> nomes = ['Ana', 'Pedro'];
  // List nomes = ['Ana', 'Pedro'];
  // print(nomes.toString());
  // print(nomes[0]);
  // print(nomes[2]);
  // print(nomes[-1]);
  // print(nomes.isEmpty);
  // print(nomes.first);
  // print(nomes.firstOrNull);
  // // For 
  // for(var i = 0; i < nomes.length; i++){
  //   print(nomes[i]);
  // }
  // // For each
  // for (final nome in nomes) {
  //   print(nome);
  // }
  // // Adição de elementos
  // nomes.add('Cristina');
  // nomes.insert(0, 'Maria');
  // nomes.insert(4, 'João');
  // nomes.insert(nomes.length, 'Pablo');
  // nomes.insert(15,"Paula"); //Isso dá erro!
// }

import 'dart:io';
import 'dart:math';
void main (){
  stdout.writeln('\n\tBem vindo a MEGASENA!');
  var jogoUsuario = <int>[];
  // Permitir que o usuário jogue, cuidando da repetição
  while (jogoUsuario.length < 6){
    stdout.writeln('\nEscolha o próximo número!');
    var numero = int.parse(stdin.readLineSync()!);
    if(numero < 1 || numero > 60){
      stdout.writeln('$numero não é um número valído!');
      continue;
    }
    if(jogoUsuario.contains(numero)){
      stdout.writeln('$numero já foi escolhido!');
      continue;
    }
    jogoUsuario.add(numero);
  }
  // Sortear seis números, sem repetição
  var gerador = Random();
  List<int> jogoSorteado = [];
  while (jogoSorteado.length < 6){
    var numero = gerador.nextInt(60) + 1;
    if (!jogoSorteado.contains(numero)){
      jogoSorteado.insert(0, numero);
    }
  }
  // Ordenar as duas listas
  jogoUsuario.sort();
  jogoSorteado.sort();

  // Verificar quais itens o jovem acertou
  var nAcertos = 0;
  var numeroCorretos = <int>[];
  for (final numero in jogoUsuario){
    if (jogoSorteado.contains(numero)){
      numeroCorretos.add(numero);
      nAcertos++;
    }
  }

  // Se ele ganhou, avise
  stdout.writeln('\nSua aposta é a seguinte:\t$jogoUsuario\nOs números sorteados foram:\t$jogoSorteado');
  if (nAcertos == 6){
    stdout.writeln('\nVocê acertou os seguintes números:\t$numeroCorretos\nVocê ganhou!');
  }else {
    stdout.writeln('\nVocê acertou os seguintes números:\t$numeroCorretos\nVocê Perdeu!');
  }
}