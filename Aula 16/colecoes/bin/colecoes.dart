import 'dart:io';

void main() {
  // var pessoa = {
  //   'nome': 'Ana',
  //   'idade': 22,
  //   'altura': 1.8,
  //   'deMaior': true
  // };
  // print(pessoa.runtimeType);

  // var pessoa2 = {
  //   'idade': 22,
  //   'altura': 1.8
  // };
  // print(pessoa2.runtimeType);

  // Map <String, Object> pessoa = {
  //   'nome': 'Ana',
  //   'idade': 19
  // };

  // print(pessoa['nome']);
  // print(pessoa['altura']);

  // Map pessoa2 = {
  // };

  // var pessoa = <String, dynamic>{'nome': 'João'};
  // print(pessoa['nome'].runtimeType);

  // var nome = pessoa['nome'] as String;
  // print(nome.runtimeType);

  // var nome = pessoa['nome'] as int;
  // print(nome.toUpperCase());

  // var pessoa = <String, Object>{'nome': 'Ana', 'idade': 18};

  // //Método keys
  // var chaves = pessoa.keys;
  // print(chaves.runtimeType);
  // for (final chave in chaves) {
  //   print(chave);
  //   print(pessoa[chave]);
  // }

  // //values
  // var valores = pessoa.values;
  // for (final valor in valores) {
  //   print(valor);
  // }

  // //entries
  // var entries = pessoa.entries;
  // for (final entry in entries) {
  //   print(entry);
  //   print(entry.key);
  //   print(entry.value);
  // }
  var id = 1;
  void criarContato(Map listaContatos, int id) {
    print('\nDigite o nome do novo contato:');
    var nomeContato = stdin.readLineSync()!;
    print('\nDigite o número do novo contato:');
    var numeroContato = stdin.readLineSync()!;
    Map<String, String> contato = {
      "Nome": nomeContato,
      "Numero": numeroContato
    };
    Map contatoPronto = {id: contato};
    listaContatos.addAll(contatoPronto);
  }

  void atualizarContato(Map listaContatos) {
    print('\nDigite o nome do contato que deseja atualizar o número!');
    var nomeContato = stdin.readLineSync()!;
    print('\nDigite o novo número do contato!');
    var novoNumero = stdin.readLineSync()!;
    var entries = listaContatos.entries;
    for (final entry in entries) {
      if (nomeContato == entry.value['Nome']) {
        entry.value['Numero'] = novoNumero;
      }
    }
  }

  void deletarContato(Map listaContatos) {
    print('\nDigite o nome do contato que deseja deletar!');
    var nomeContato = stdin.readLineSync()!;
    var entries = listaContatos.entries;
    var keyContato = 0;
    for (final entry in entries) {
      if (nomeContato == entry.value['Nome']) {
        keyContato = entry.key;
      }
    }
    listaContatos.remove(keyContato);
  }

  // Lista de contatos
  Map listaContatos = {};
  for (;;) {
    print(
        "\n\tEscolha uma ação:\n\n\t1. Verificar Contato\n\t2. Adicionar Contato\n\t3. Atualizar Contato\n\t4. Deletar Contato\n\t5. Sair");
    var opcao = int.parse(stdin.readLineSync()!);
    if (opcao == 5) {
      exit(10);
    } else {
      switch (opcao) {
        case == 1:
          print("**********************************");
          print("\tID\tNome\tNúmero\n");
          var entries = listaContatos.entries;
          for (final entry in entries) {
            var chave = entry.key;
            var nome = entry.value['Nome'];
            var numero = entry.value['Numero'];
            // print(entry.value['Nome']);
            print("\t$chave\t$nome\t$numero");
          }
          print("**********************************");
          break;
        case == 2:
          criarContato(listaContatos, id);
          id++;
          break;
        case == 3:
          atualizarContato(listaContatos);
          break;
        case == 4:
          deletarContato(listaContatos);
          break;
      }
    }
  }
}
