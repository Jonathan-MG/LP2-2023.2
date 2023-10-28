import 'package:flutter/material.dart';

class LoginTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(28.0),
        child: Column(children: [
          emailField(),
          passwordField(),
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: 12.0),
                child: submitButton(),
              ))
            ],
          )
        ]));
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'seu@email.com', labelText: 'Digite seu e-mail'),
    );
  }

  Widget passwordField() {
    bool passwordstate = true;
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          hintText: 'Sua senha',
          labelText: 'Digite sua senha.',
          suffixIcon: IconButton(
              icon:
                  Icon(passwordstate ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                print(passwordstate);
                passwordstate = passwordstate ? false : true;
                print(passwordstate);
              })),
      obscureText: passwordstate,
    );
  }

  Widget submitButton() {
    return ElevatedButton(onPressed: () {}, child: Text('Entrar'));
  }
}
