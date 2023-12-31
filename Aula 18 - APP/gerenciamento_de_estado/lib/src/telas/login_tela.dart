import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(28),
      child: Column(
        children: [
          nomeField(bloc),
          emailField(bloc),
          passwordField(bloc),
          Row(children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 12), child: submitButton(bloc)),
            )
          ])
        ],
      ),
    );
  }

  Widget nomeField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.nome,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
            onChanged: (newValue) {
              bloc.changeNome(newValue);
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: 'João Paulo',
                labelText: 'Digite seu nome',
                // resolvendo o problema do null no inicio
                //errorText: snapshot.error.toString() == 'null' ? null : snapshot.error.toString()
                errorText: snapshot.error
                    ?.toString() //outra forma de fazer a mesma coisa
                ));
      },
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
            onChanged: (newValue) {
              bloc.changeEmail(newValue);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'seu@email.com',
                labelText: 'Digite seu e-mail',
                // resolvendo o problema do null no inicio
                //errorText: snapshot.error.toString() == 'null' ? null : snapshot.error.toString()
                errorText: snapshot.error
                    ?.toString() //outra forma de fazer a mesma coisa
                ));
      },
    );
    // return TextField(
    //     keyboardType: TextInputType.emailAddress,
    //     decoration: InputDecoration(
    //         hintText: 'seu@email.com', labelText: 'Digite seu e-mail'));
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) => TextField(
              onChanged:
                  bloc.changePassword, //mais uma forma de fazer a mesma coisa
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Senha',
                  labelText: 'Digite sua senha',
                  // resolvendo o problema do null no inicio
                  errorText: snapshot.error.toString() == 'null'
                      ? null
                      : snapshot.error.toString()),
            ));
    // return TextField(
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.emailAndPasswordAreOk,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData ? () => bloc.submitForm(context) : null,
          child: Text('Entrar'),
        );
      },
    );
  }
}
