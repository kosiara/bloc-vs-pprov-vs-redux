import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 0: create model class which extends ChangeNotifier
class UserLogin with ChangeNotifier {
  String _user;
  String get user => _user;

  String _pass;
  String get pass => _pass;

  bool _result = false;
  bool get result => _result;

  void checkCredentials(String user, String password) {
    _user = user;
    _pass = password;

    // implement user/pass check
    _result = true;
    notifyListeners();
  }
}

class ProviderExamplePage extends StatefulWidget {
  ProviderExamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProviderExamplePageState createState() => _ProviderExamplePageState();
}

class _ProviderExamplePageState extends State<ProviderExamplePage> {

  @override
  Widget build(BuildContext context) {
    // 1: provide state
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => UserLogin())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginWidget(),
              ResultWidget(),
              ProgressWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        children: <Widget>[
          FormContainer(),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: SignInButton(),
          )
        ],
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<UserLogin>(
        builder: (context, userLogin, _) {
          return
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("Result: " + (userLogin.result ? "OK" : "WRONG")),
            );
        });
  }
}

class ProgressWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}

// source: https://flutterawesome.com/a-new-open-source-flutter-login-home-animation/
class FormContainer extends StatelessWidget {
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
                  ),
                  new InputFieldArea(
                    hint: "Password",
                    obscure: true,
                    icon: Icons.lock_outline,
                  ),
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
  InputFieldArea({this.hint, this.obscure, this.icon});
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

class SignInButton extends StatelessWidget {
  SignInButton();
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 320.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: const Color.fromRGBO(247, 64, 106, 1.0),
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
      ),
      child: new Text(
        "Sign In",
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    ));
  }
}