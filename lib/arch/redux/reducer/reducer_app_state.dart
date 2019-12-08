import 'package:flutter_arch/arch/redux/model/app_state.dart';
import 'package:flutter_arch/arch/redux/reducer/reducer_login.dart';

/// combine many reducers into one
AppState appReducer(AppState state, action) {
  return AppState(
    loggedUser: loginReducer(state.loggedUser, action),
    // hint: other reducers go here
  );
}
