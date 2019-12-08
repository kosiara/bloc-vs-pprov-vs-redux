import 'package:flutter/material.dart';

class UserLogin with ChangeNotifier {
  String _user;
  String _pass;
  bool _result;

  String get user => _user;

  String get pass => _pass;

  bool get result => _result;

  void checkCredentials(String user, String password) {
    _user = user;
    _pass = password;

    if (user != null &&
        user.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      _result = true;
    } else
      _result = false;

    notifyListeners();
  }
}
