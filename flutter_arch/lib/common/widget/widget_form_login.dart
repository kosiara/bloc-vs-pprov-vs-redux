import 'package:flutter/material.dart';
import 'package:flutter_arch/common/widget/widget_container_form.dart';
import 'package:flutter_arch/common/widget/widget_signin_btn.dart';

class LoginFormWidget extends StatelessWidget {
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
