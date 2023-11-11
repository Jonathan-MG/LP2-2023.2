import 'dart:async';

mixin Validators {
  static final RegExpNome = RegExp(r'[A-Z][a-z]{2,} [A-Z][a-z]+');
  static final RegExpNumero = RegExp('^\\([0-9]{2}\\) [0-9]{5}-[0-9]{4}\$');

  final validarNome = StreamTransformer<String, String>.fromHandlers(
      handleData: (nomeDigitado, sink) {
    if (RegExpNome.hasMatch(nomeDigitado)) {
      sink.add(nomeDigitado);
    } else {
      sink.addError('Nome inválido');
    }
  });

  final validarNumero = StreamTransformer<String, String>.fromHandlers(
      handleData: (numeroDigitado, sink) {
    if (RegExpNumero.hasMatch(numeroDigitado)) {
      sink.add(numeroDigitado);
    } else {
      sink.addError('Número inválido');
    }
  });
}
