import 'package:flutter/material.dart';

class App extends StatefulWidget {
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Minhas imagens"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              numeroImagens++;
              print(numeroImagens);
            });
          },
          child: Icon(Icons.add_a_photo),
        ),
        body: Text('$numeroImagens'),
      ),
    );
  }
}
