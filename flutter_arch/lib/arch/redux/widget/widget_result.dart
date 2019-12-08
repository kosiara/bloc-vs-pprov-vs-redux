import 'package:flutter/material.dart';
import 'package:flutter_arch/arch/redux/model/app_state.dart';
import 'package:flutter_arch/arch/redux/model/userlogin.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserLogin user = StoreProvider.of<AppState>(context).state.loggedUser;
    bool loggedIn = user != null;
    bool correctPassword = loggedIn && user.checkCredentials();
    final resultWidget = loggedIn ? Text("Result: " + (correctPassword ? "OK" : "WRONG"))
        : Text("");
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: resultWidget,
    );
  }
}
