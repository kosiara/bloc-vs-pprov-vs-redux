import 'package:flutter_arch/arch/redux/model/userlogin.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final UserLogin loggedUser;

  AppState({this.loggedUser});

  static AppState noLoggedUser() => AppState(loggedUser: null);

  @override
  int get hashCode => loggedUser.hashCode;

  AppState copyWith({
    UserLogin loggedUser,
  }) {
    return AppState(
      loggedUser: loggedUser ?? this.loggedUser,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loggedUser == other.loggedUser;

  @override
  String toString() {
    return 'AppState{loggedUser: $loggedUser}';
  }
}
