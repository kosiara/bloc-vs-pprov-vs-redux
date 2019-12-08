import 'package:flutter/material.dart';
import 'package:flutter_arch/arch/redux/actions/actions.dart';
import 'package:flutter_arch/arch/redux/model/app_state.dart';
import 'package:flutter_arch/arch/redux/widget/widget_result.dart';
import 'package:flutter_arch/common/widget/widget_form_login.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
              LoginFormWidget(onSignIn),
              ResultWidget(),
            ],
          ),
        ),
      );
  }

  void onSignIn(String user, String password, BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(LoginRequestAction(user, password));
  }
}
