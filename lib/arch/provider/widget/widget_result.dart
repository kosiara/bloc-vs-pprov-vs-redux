import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_arch/arch/provider/model/userlogin.dart';

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserLogin>(builder: (context, userLogin, _) {
      final resultWidget = (userLogin.result != null)
          ? Text("Result: " + (userLogin.result ? "OK" : "WRONG"))
          : Text("");
      return Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: resultWidget,
      );
    });
  }
}
