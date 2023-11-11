import 'package:flutter/material.dart';

class Lista_telefonica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(28),
      child: Column(
        children: [
          nomeField(),
          telefoneField(),
          Row(children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: botaoCadastro(),
              )
            )
          ],)
        ],
      ),
    );
  }
}

Widget nomeField() {
  return TextField(
    decoration: InputDecoration(
      keyboardType: TextInputType.name,
      labelText: 'Nome',
      hintText: 'Digite seu nome',
    ),
  );
}

Widget telefoneField() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Telefone',
      hintText: 'Digite seu telefone',
    ),
  );
}

Widget botaoCadastro() {
  return ElevatedButton(
    child: Text('Cadastrar'),
    onPressed: () {},
  );
}
