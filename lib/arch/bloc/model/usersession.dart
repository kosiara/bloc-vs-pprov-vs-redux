import 'package:meta/meta.dart';

///State class used to notify UI of current authentication state
abstract class UserAuthenticationState {}

@immutable
class UserSession extends UserAuthenticationState {
  final String login;
  final String token;

  UserSession(this.login, this.token);
}

@immutable
class UserAuthenticationLoading extends UserAuthenticationState {}

@immutable
class UserSignedOff extends UserAuthenticationState {}

@immutable
class UserUnauthenticated extends UserAuthenticationState {
  final String user;
  final Exception exception;

  UserUnauthenticated({
    this.user,
    this.exception,
  });
}


