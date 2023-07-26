import 'package:flutter/material.dart';

abstract class RegisterScreenNavigator extends ChangeNotifier {
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true});

  void showLoading();

  void hideLoading();
}
