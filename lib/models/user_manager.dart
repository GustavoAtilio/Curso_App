import 'package:flutter/material.dart';

import 'user.dart';

class UserManager extends ChangeNotifier {
  bool loading = false;
  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> signIn({required User user, required Function onFail}) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 6));
    setLoading(false);
    onFail("Error test");
  }
}
