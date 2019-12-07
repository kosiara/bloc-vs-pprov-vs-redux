
import 'dart:io';
import 'package:flutter_arch/arch/bloc/model/userlogin.dart';
import 'package:flutter_arch/arch/bloc/model/usersession.dart';

class UserRepository {

  @override
  Future<UserSession> signIn(UserLogin userCredentials) {
    // should call userService.signIn(userCredentials);
    print("Logging in...");
    sleep(const Duration(seconds:1));
    return Future.value(UserSession(userCredentials.login, "12876sad87x786c6"));
  }

  @override
  Future<UserSignedOff> signOut() {
    // should call userService.signOut();
    return Future.value(UserSignedOff());
  }
}
