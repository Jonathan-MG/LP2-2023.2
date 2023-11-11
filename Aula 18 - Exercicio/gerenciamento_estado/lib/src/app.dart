import 'package:flutter/material.dart';
import './telas/home.dart';
//import 'blocs/provider.dart';

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       child: MaterialApp(
//         title: 'Lista Telefonica',
//         home: Scaffold(
//           body: Lista_telefonica(),
//         ),
//       ),
//     );
//   }
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Telefonica',
      home: Scaffold(
        body: Lista_telefonica(),
      ),
    );
  }
}