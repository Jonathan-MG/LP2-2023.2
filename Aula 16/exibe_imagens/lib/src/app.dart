import 'package:exibe_imagens/src/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class App extends StatefulWidget {
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  void obterImagem() {
    // 1. Montar a URL incluindo: host, recurso e parâmetros de query (query, page, per_page)
    // URI -> Uniform resource identifier
    String stringPagina = numeroImagens.toString();
    final url = Uri.https('api.pexels.com', '/v1/search',
        {'query': 'cats', 'page': stringPagina, 'per_page': '1'});
    // 2. Monstar um objeto Request com: Método get e a URL construída anteriormente
    final req = http.Request('get', url);
    // 3. Adicionar o header Authorization à requisição, associado à nossa chave pexels
    req.headers.addAll({
      'Authorization':
          'ZQNyDNVADHauGkAx99SsggjoC35kATx8tOVJNH1yqcXgNssoB8NAcv8Z'
    });
    // 4. Enviar a requisição
    req.send().then((result) {
      http.Response.fromStream(result).then((response) {
        // print(response.body);
        // Converter (json String) -> Map -> ImageModel
        final decodedJSON = json.decode(response.body);
        final imagem = ImageModel.fromJSON(decodedJSON);
        print(imagem);
      });
    });
  }

  int numeroImagens = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Minhas imagens"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {setState(() {
            numeroImagens++;
            obterImagem();
          });
          },
          child: Icon(Icons.add_a_photo),
        ),
        body: Text('$numeroImagens'),
      ),
    );
  }
}
