import 'package:flutter_arch/arch/redux/model/userlogin.dart';

/// In response to LoginButton click, handled by middleware
class LoginRequestAction {
  final String username;
  final String password;

  LoginRequestAction(this.username, this.password);

  @override
  String toString() {
    return 'LoginRequestAction{username: $username, pass: xxxxx}';
  }
}

/// Invoked by middleware after successful user login, handled by reducer
class LoginSuccessfulAction {
  final UserLogin user;

  LoginSuccessfulAction(this.user);

  @override
  String toString() {
    return 'LoginSuccessfulAction{user: $user}';
  }
}

/// Invoked by middleware after unsuccessful user login, handled by reducer
class LoginUnsuccessfulAction {}
