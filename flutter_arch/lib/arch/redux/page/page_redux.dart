import 'package:flutter/material.dart';
import 'package:flutter_arch/common/widget/widget_form_login.dart';

class ReduxExamplePage extends StatefulWidget {
  ReduxExamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ReduxExamplePageState createState() => _ReduxExamplePageState();
}

class _ReduxExamplePageState extends State<ReduxExamplePage> {
  @override
  Widget build(BuildContext context) {
    // 1: provide state
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginFormWidget(),
              ResultWidget(),
              ProgressWidget()
            ],
          ),
        ),
      );
  }
}

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final resultWidget = true ? Text("Result: " + (true ? "OK" : "WRONG"))
          : Text("");
      return Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: resultWidget,
      );
  }
}

class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final userLogin = Provider.of<UserLogin>(context);
//    String log = "";
//    if (userLogin.result != null && userLogin.result)
//      log = "Logging in: ${userLogin.user}";
    return Text("aaa"); //Text(log);
  }
}