import 'package:flutter/material.dart';
import 'package:flutter_arch/arch/provider/model/userlogin.dart';
import 'package:flutter_arch/arch/provider/widget/widget_progress.dart';
import 'package:flutter_arch/arch/provider/widget/widget_result.dart';
import 'package:flutter_arch/common/widget/widget_form_login.dart';
import 'package:provider/provider.dart';

class ProviderExamplePage extends StatefulWidget {
  ProviderExamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProviderExamplePageState createState() => _ProviderExamplePageState();
}

class _ProviderExamplePageState extends State<ProviderExamplePage> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(builder: (context) => UserLogin())],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginFormWidget(onSignIn),
              ResultWidget(),
              ProgressWidget()
            ],
          ),
        ),
      ),
    );
  }

  void onSignIn(String user, String password, BuildContext context) {
    final userLogin = Provider.of<UserLogin>(context);
    userLogin.checkCredentials(
        user, password);
    print("Sign-in clicked");
  }
}

