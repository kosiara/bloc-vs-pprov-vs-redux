import 'package:flutter_arch/arch/bloc/model/userlogin.dart';
import 'package:flutter_arch/arch/bloc/model/usersession.dart';

class UserRepository {

  Future<UserAuthenticationState> signIn(UserLogin userCredentials) async {
    print("Logging in...");
    return Future.delayed(Duration(seconds: 1), () {
      if (userCredentials.login.isNotEmpty &&
          userCredentials.password.isNotEmpty) {
        return UserSession(userCredentials.login, "4858581b-b38e-4e71-8b8d-2d92c93c3888");
      } else {
        return UserUnauthenticated(
          user: userCredentials.login,
          exception: Exception("Wrong password"),
        );
      }
    });
  }

  Future<UserSignedOff> signOut() {
    return Future.value(UserSignedOff());
  }
}
