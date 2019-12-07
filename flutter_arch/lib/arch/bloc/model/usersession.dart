import 'package:meta/meta.dart';

///State class used to notify UI of current authentication state
abstract class UserAuthenticationState {}

@immutable
class UserSession extends UserAuthenticationState {
  final String login;
  final String token;

  UserSession(this.login, this.token);
}

class UserAuthenticationLoading extends UserAuthenticationState {}

class UserSignedOff extends UserAuthenticationState {}

class UserUnauthenticated extends UserAuthenticationState {
  final String user;
  final Exception exception;

  UserUnauthenticated({
    this.user,
    this.exception,
  });
}


