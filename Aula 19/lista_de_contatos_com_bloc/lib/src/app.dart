import 'package:flutter/material.dart';
import 'package:lista_de_contatos_com_bloc/src/blocs/provider.dart';
import 'package:lista_de_contatos_com_bloc/src/widgets/contatos_widget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
            title: "Contatos", home: Scaffold(body: ContatosWidget())));
  }
}
