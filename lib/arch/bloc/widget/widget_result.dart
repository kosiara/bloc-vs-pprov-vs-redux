import 'package:flutter/material.dart';
import 'package:flutter_arch/arch/bloc/model/usersession.dart';

class ResultWidget extends StatefulWidget {

  final Stream<UserAuthenticationState> userSigned;

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