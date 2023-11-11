import 'dart:async';

mixin Validators {
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    RegExp exp = RegExp("^[A-Z]+");
    //Tem que ter sobrenome e nome
    if (name.length < 3) {
      sink.addError("Nome deve ter mais de 3 caracteres");
    } else if (!exp.hasMatch(name)) {
      sink.addError('Nome deve iniciar com letra maiúscula');
    } else if (!name.contains(" ")) {
      sink.addError('Nome deve ter sobrenome');
    } else {
      sink.add(name);
    }
  });

  final validatePhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    //Telefone tem que estar no formato (xx) xxxxx-xxxx e o usuario digita todos os simbolos
    RegExp exp = RegExp(r"^(0-9) {2} (0-9) {5} (0-9) {4}");
    if (phone.length < 8) {
      sink.addError('Telefone deve ter mais de 8 caracteres');
    } else if (!exp.hasMatch(phone)) {
      sink.addError('Telefone deve estar no formato: (xx) xxxxx-xxxx');
    }
    else{
      sink.add(phone);}
  });
}
