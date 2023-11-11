import 'package:flutter/material.dart';
import 'package:lista_de_contatos_com_bloc/src/widgets/contato_widget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contatos",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: ContatoWidget('José Santos', '(11) 91122-3344'),
      ),
    );
  }
}
