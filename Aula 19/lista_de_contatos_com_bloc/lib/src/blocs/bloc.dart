import 'validators.dart';
import 'dart:async';
import '../models/contato_model.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _nomeController = BehaviorSubject<String>();
  final _numeroController = BehaviorSubject<String>();
  final _contatosController = StreamController<List<Contato>>();
  final List<Contato> _contatos = [];

  Stream<String> get nome => _nomeController.stream.transform(validarNome);
  Stream<String> get numero =>
      _numeroController.stream.transform(validarNumero);
  Stream<bool> get nomeAndNumeroAreOk =>
      CombineLatestStream.combine2(nome, numero, (no, nu) => true);
  Stream<List<Contato>> get contatos => _contatosController.stream;

  Function(String) get mudarNome => _nomeController.sink.add;
  Function(String) get mudarNumero => _numeroController.sink.add;

  void adicionarContato() {
    Contato contato =
        new Contato(_nomeController.value, _numeroController.value);
    _contatos.add(contato);
    _contatosController.sink.add(_contatos);
  }

  void dispose() {
    _nomeController.close();
    _numeroController.close();
    _contatosController.close();
  }
}