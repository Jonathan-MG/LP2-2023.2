import 'package:flutter/material.dart';
import 'package:lista_de_contatos_com_bloc/src/blocs/provider.dart';
import 'package:lista_de_contatos_com_bloc/src/widgets/contato_widget.dart';
import '../blocs/bloc.dart';
import '../models/contato_model.dart';

class ContatosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          nomeField(bloc),
          numeroField(bloc),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Row(
              children: <Widget>[Expanded(child: submitButton(bloc))],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(children: <Widget>[
              Expanded(
                child: contatosList(bloc),
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget nomeField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.nome,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: (valorDigitado) {
              bloc.mudarNome(valorDigitado);
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Nome',
                errorText: snapshot.hasError ? '${snapshot.error}' : null),
          );
        });
  }

  Widget numeroField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.numero,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: (valorDigitado) {
              bloc.mudarNumero(valorDigitado);
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: "Telefone",
                hintText: "(xx) xxxxx-xxxx",
                errorText: snapshot.hasError ? '${snapshot.error}' : null),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.nomeAndNumeroAreOk,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return ElevatedButton(
              onPressed:
                  snapshot.hasData ? () => bloc.adicionarContato() : null,
              child: Text("Adicionar"));
        });
  }

  Widget contatosList(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.contatos,
        builder: (context, AsyncSnapshot<List<Contato>> snapshot) {
          return Column(
              children: snapshot.hasData
                  ? snapshot.data!
                      .map((contato) =>
                          ContatoWidget(contato.nome, contato.numero))
                      .toList()
                  : []);
        });
  }
}
