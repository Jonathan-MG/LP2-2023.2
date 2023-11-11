import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:gerenciamento_de_estado/src/blocs/validators.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

class Bloc with Validators {
  final _nomeController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get nome => _nomeController.stream.transform(validate_Nome);
  Stream<String> get email => _emailController.stream.transform(validate_Email);
  Stream<String> get password =>
      _passwordController.stream.transform(validate_Password);
  Stream<bool> get emailAndPasswordAreOk =>
      CombineLatestStream.combine3(nome, email, password, (n, e, p) => true);

  void submitForm(BuildContext context) {
    final nome = _nomeController.value;
    final email = _emailController.value;
    final password = _passwordController.value;
    CherryToast.success(title: Text('$nome, $email, $password')).show(context);
  }

  Function(String) get changeNome => _nomeController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose() {
    _nomeController.close();
    _emailController.close();
    _passwordController.close();
  }
}

//final bloc = Bloc(); // Singleton - Apenas uma instancia do bloc não é mais necessários, pois o bloc está sendo injetado no app.dart
