import 'package:flutter/material.dart';
import 'package:flutter_arch/arch/bloc/bloc_sign_in_user.dart';
import 'package:flutter_arch/arch/bloc/model/userlogin.dart';
import 'package:flutter_arch/arch/bloc/model/usersession.dart';
import 'package:flutter_arch/arch/bloc/repo/repository_user.dart';
import 'package:flutter_arch/common/widget/widget_form_login.dart';

class BlocExamplePage extends StatefulWidget {
  BlocExamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BlocExamplePageState createState() => _BlocExamplePageState();
}

class _BlocExamplePageState extends State<BlocExamplePage> {

  // WARN: use proper initialization for BLOC ! This is just for demonstration
  UserSignInBloc _userSignInBloc = UserSignInBloc(UserRepository());

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
              ResultWidget(_userSignInBloc.userSigned),
            ],
          ),
      ),
    );
  }

  void onSignIn(String user, String password, BuildContext context) {
    _userSignInBloc.login.add(UserLogin(user, password));
    print("Sign-in clicked");
  }
}

class ResultWidget extends StatefulWidget {

  Stream<UserAuthenticationState> userSigned;

  ResultWidget(this.userSigned);

  @override
  _ResultWidgetState createState() => _ResultWidgetState(userSigned);
}

class _ResultWidgetState extends State<ResultWidget> {
  var loginResultText = "";

  _ResultWidgetState(Stream<UserAuthenticationState> userSigned){
     userSigned.listen(onLoginDataChanged);
  }

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Text(loginResultText),
      );
  }

  void onLoginDataChanged(UserAuthenticationState event) {
    if (event is UserAuthenticationLoading) {
      setState(() {
        loginResultText = "LOADING...";
      });
    } else if (event is UserUnauthenticated) {
      setState(() {
        loginResultText = "Result: WRONG";
      });
    } else if (event is UserSession) {
      setState(() {
        loginResultText = "Result: OK";
      });
    }
  }
}
