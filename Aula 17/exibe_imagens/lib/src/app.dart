import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 0;
  List<ImageModel> imagens = [];
  int page = 1;

  void obterImagem() async {
    var url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {'query': 'people', 'page': page.toString(), 'per_page': '1'},
    );
    var req = http.Request('get', url);
    req.headers.addAll(
      {
        'Authorization':
            'ZQNyDNVADHauGkAx99SsggjoC35kATx8tOVJNH1yqcXgNssoB8NAcv8Z',
      },
    );
    final result = await req.send();
    page++;
    if (result.statusCode == 200) {
      final response = await http.Response.fromStream(result);
      var decodedJSON = json.decode(response.body);
      var imagem = ImageModel.fromJSON(decodedJSON);
      setState(() {
        imagens.add(imagem);
      });
    } else {
      print('Falhou');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Minhas Imagens"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: obterImagem,
      ),
      body: ImageList(imagens),
    ));
  }
}
