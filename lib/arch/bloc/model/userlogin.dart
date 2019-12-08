import 'package:meta/meta.dart';

@immutable
class UserLogin {
  final String login;
  final String password;

  UserLogin(this.login, this.password);
}