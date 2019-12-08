import 'package:flutter/material.dart';
import 'package:flutter_arch/common/widget/widget_container_form.dart';
import 'package:flutter_arch/common/widget/widget_signin_btn.dart';

class LoginFormWidget extends StatefulWidget {

  final Function(String user, String password, BuildContext context) onSignIn;

  LoginFormWidget(this.onSignIn);

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final userTxtController = TextEditingController();
  final passTxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        children: <Widget>[
          FormContainer(userTxtController, passTxtController),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: SignInButton(() => widget.onSignIn(userTxtController.value.text, passTxtController.value.text, context)),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    userTxtController.dispose();
    passTxtController.dispose();
    super.dispose();
  }
}
