import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_arch/arch/provider/model/userlogin.dart';

class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userLogin = Provider.of<UserLogin>(context);
    String log = "";
    if (userLogin.result != null && userLogin.result)
      log = "Logging in: ${userLogin.user}";
    return Text(log);
  }
}
