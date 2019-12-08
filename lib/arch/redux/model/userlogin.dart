import 'package:meta/meta.dart';

@immutable
class UserLogin {
  final String login;
  final String password;

  UserLogin(this.login, this.password);

  bool checkCredentials() {

    if (login != null &&
        login.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      return true;
      // user/pass check goes here
    } else
      return false;
  }

  @override
  int get hashCode => login.hashCode ^ password.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserLogin &&
              runtimeType == other.runtimeType &&
              login == other.login &&
              password == other.password;

  @override
  String toString() {
    return 'UserLogin{login: $login, password: $password}';
  }
}