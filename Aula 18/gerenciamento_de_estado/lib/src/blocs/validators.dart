import 'dart:async';
import 'package:email_validator/email_validator.dart';

mixin Validators {
  final validadeEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (EmailValidator.validate(email)) {
        sink.add(email);
      } else {
        sink.addError('E-mail inválido');
      }
    },
  );
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      // RegExp exp = RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*d)(?=.*[!@#\$%^&*])(?=.{8,})");
      RegExp exp = RegExp("[A-Z]+");
    },
  );
}

// void main(){
//   var senha1 = 'SenhaValida!';
//   var senha2 = 'senhavalida!';
//   var senha3 = '122345';
//   var senha4 = '#%@%#';
//   var senha5 = 'SenhaValida1';
  
//   var senhas = [
//     senha1,
//     senha2,
//     senha3,
//     senha4,
//     senha5
//   ];
  
  
//   RegExp r1 = RegExp('[A-Z]+');
//   RegExp r2 = RegExp('[a-z]+');
//   RegExp r3 = RegExp(r'\d+');
//   RegExp r4 = RegExp(r'^a-zA-Z0-9');
//   RegExp r5 = RegExp(r'a-zA-Z0-9');
  
  
//  print('Maiúsculas');
//   for (final senha in senhas){
//     print(r1.hasMatch(senha));
//   }
//   print('*****************************');
//   print('Minúsculas');
//   for (final senha in senhas){
//     print(r2.hasMatch(senha));
//   }
//   print('*****************************');
//   print('Números');
//   for (final senha in senhas){
//     print(r3.hasMatch(senha));
//   }
//   print('*****************************');
//   print('Especiais');
//   for (final senha in senhas){
//     print(r4.hasMatch(senha));
//   }
//   print('*****************************');
//   print('Tudo menos especial');
//   for (final senha in senhas){
//     print(r5.hasMatch(senha));
// }}