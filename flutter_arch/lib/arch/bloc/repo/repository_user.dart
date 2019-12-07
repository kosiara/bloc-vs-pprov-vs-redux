import 'package:flutter_arch/arch/bloc/model/userlogin.dart';
import 'package:flutter_arch/arch/bloc/model/usersession.dart';

class UserRepository {
  @override
  Future<UserAuthenticationState> signIn(UserLogin userCredentials) async {
    // should call userService.signIn(userCredentials);
    print("Logging in...");
    return Future.delayed(Duration(seconds: 1), () {
      if (userCredentials.login.isNotEmpty &&
          userCredentials.password.isNotEmpty) {
        return UserSession(userCredentials.login, "12876sad87x786c6");
      } else {
        return UserUnauthenticated(
          user: userCredentials.login,
          exception: Exception("Wrong password"),
        );
      }
    });
  }

  @override
  Future<UserSignedOff> signOut() {
    // should call userService.signOut();
    return Future.value(UserSignedOff());
  }
}
