//import para captura de dados
import 'dart:io';
//import para geração de valores aleatórios
import 'dart:math';

//1: pedra, 2: papel, 3: tesoura, 4: sair usando um enum
enum Opcoes { Pedra, Papel, Tesoura }
void main() {
  var Pontos_jogador = 0;
  var Pontos_computador = 0;
  //exibir menu
  var opcao;
  print('\nEscolha uma Opção:\n\t1:Jogar\n\t2:Sair\n');
  do {
    opcao = int.parse(stdin.readLineSync()!);
  } while (opcao < 0 || opcao > 2);
  if (opcao == 2) {
    exit(10);
  } else {
    for (;;) {
      if ((Pontos_computador == 3) || (Pontos_jogador == 3)) {
        Pontos_computador = 0;
        Pontos_jogador = 0;
      }
      print(
          '\nEste jogo é uma melhor de 3!\n\t1: Pedra\n\t2: Papel\n\t3: Tesoura\n\t4: Desistir\n\nPontuação:\n\tJogador: ${Pontos_jogador}\n\tComputador: ${Pontos_computador}');
      //capturar a opção do usuário, fazendo validação com
      //do//while
      do {
        opcao = int.parse(stdin.readLineSync()!);
      } while (opcao < 0 || opcao > 4);
      //se o usuário digitar 4, sair
      if (opcao == 4) {
        exit(10);
      } else {
        //senão
        //sortear a opção do computador
        final gerar_numero = Random();
        final opcao_computador = gerar_numero.nextInt(3) + 1;
        //mapear a opção do usuário de int para enum
        var jogada_jogador;
        switch (opcao) {
          case 1:
            jogada_jogador = Opcoes.Pedra.name;
            break;
          case 2:
            jogada_jogador = Opcoes.Papel.name;
            break;
          case 3:
            jogada_jogador = Opcoes.Tesoura.name;
            break;
        }
        //mapear a opção do computador de int para enum
        var jogada_computador;
        switch (opcao_computador) {
          case 1:
            jogada_computador = Opcoes.Pedra.name;
            break;
          case 2:
            jogada_computador = Opcoes.Papel.name;
            break;
          case 3:
            jogada_computador = Opcoes.Tesoura.name;
            break;
        }
        //exibir as opções de cada um
        //você (pedra) vs (tesoura) computador
        print('Você ${jogada_jogador} vs ${jogada_computador} Computador');
        //verificar o resultado (vencedor ou empate) e exibir
        if ((jogada_jogador == Opcoes.Pedra.name &&
                jogada_computador == Opcoes.Tesoura.name) ||
            (jogada_jogador == Opcoes.Tesoura.name &&
                jogada_computador == Opcoes.Papel.name) ||
            (jogada_jogador == Opcoes.Papel.name &&
                jogada_computador == Opcoes.Pedra.name)) {
          print("Ponto para o Jogador!");
          Pontos_jogador++;
        } else if (jogada_jogador == jogada_computador) {
          print("Empatou!");
        } else {
          print("Ponto para o Computador!");
          Pontos_computador++;
        }
        //exibir *********************************
        print('**************************************');
        if (Pontos_jogador == 3) {
          print("Vitória do Jogador!");
        } else if (Pontos_computador == 3) {
          print("Vitória do Computador!");
        }
        //esperar 5 segundos
        sleep(Duration(seconds: 5));
      }
    }
  }
}
