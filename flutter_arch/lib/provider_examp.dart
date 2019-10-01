import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class LoginWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("LoginWidget");
  }
}

class ResultWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("ProgressWidget");
  }
}

class ProgressWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("ProgressWidget");
  }
}