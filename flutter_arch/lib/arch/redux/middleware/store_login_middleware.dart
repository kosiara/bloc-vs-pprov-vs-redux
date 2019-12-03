import 'package:flutter_arch/arch/redux/actions/actions.dart';
import 'package:flutter_arch/arch/redux/model/app_state.dart';
import 'package:flutter_arch/arch/redux/model/userlogin.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreLoginMiddleware() {
  return [
    TypedMiddleware<AppState, LoginRequestAction>(_createLoginUser()),
  ];
}

/// connects to backend API to authorize the user
Middleware<AppState> _createLoginUser(/*LoginRepository loginRepository*/) {
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is LoginRequestAction) {
      // final val user = loginRepository.loginUser();
      next(LoginSuccessfulAction(UserLogin("Myszka", "Mickey")));
      return;
    }

    next(action);
  };
}
