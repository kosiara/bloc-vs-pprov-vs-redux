import 'package:flutter/material.dart';

// source: https://flutterawesome.com/a-new-open-source-flutter-login-home-animation/
class FormContainer extends StatelessWidget {
  final TextEditingController userTxtController;
  final TextEditingController passTxtController;

  FormContainer(this.userTxtController, this.passTxtController);

  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new InputFieldArea(
                  hint: "Username",
                  obscure: false,
                  icon: Icons.person_outline,
                  controller: userTxtController),
              new InputFieldArea(
                  hint: "Password",
                  obscure: true,
                  icon: Icons.lock_outline,
                  controller: passTxtController),
            ],
          )),
        ],
      ),
    ));
  }
}

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final TextEditingController controller;

  InputFieldArea({this.hint, this.obscure, this.icon, this.controller});

  @override
  Widget build(BuildContext context) {
    return (new Container(
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 0.5,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
      child: new TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.purple,
        ),
        decoration: new InputDecoration(
          icon: new Icon(
            icon,
            color: Colors.purple,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.purple, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    ));
  }
}
