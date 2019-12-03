import 'package:flutter_arch/arch/redux/model/userlogin.dart';

/// In response to LoginButton click, handled by middleware
class LoginRequestAction {}

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
