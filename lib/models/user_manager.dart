import 'package:flutter/material.dart';

import 'user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void _loadCurrentUser() {
    print("Loading current user...");
  } //TODO: implementation of loading current

  Future<void> signIn({required User user, required Function onFail}) async {
    loading = true;
    await Future.delayed(const Duration(seconds: 6));
    loading = false;
    onFail("Error test");
  }

  Future<void> signUp({required User user, required Function onFail}) async {
    loading = true;
    await Future.delayed(const Duration(seconds: 6));
    loading = false;
    onFail("Error test");
  }

  void saveData() {}
}
