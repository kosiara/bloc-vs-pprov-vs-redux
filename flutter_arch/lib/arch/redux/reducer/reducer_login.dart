import 'package:flutter_arch/arch/redux/actions/actions.dart';
import 'package:flutter_arch/arch/redux/model/userlogin.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<UserLogin>([
  TypedReducer<UserLogin, LoginSuccessfulAction>(_setUser),
  // hint: other reducers go here
]);

UserLogin _setUser(UserLogin user, LoginSuccessfulAction action) {
  print("Previous user: $user , storing new user: ${action.user}");
  return action.user;
}
