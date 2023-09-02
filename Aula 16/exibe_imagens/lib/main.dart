// Exibir Hello, Flutter
// Importar a biblioteca
import 'package:flutter/material.dart';
// Escrever a função main
void main (){
// Contruir o widget que exibe o texto
  const app = MaterialApp(
    home: Text('Hello, Flutter'),
  );
  // Exibir o widget
  runApp(app);
}
// Hot reload: R
// Hot restart: Shift + R
// Full restart: Ctrl + C