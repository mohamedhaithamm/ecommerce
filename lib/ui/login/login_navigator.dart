import 'package:flutter/material.dart';

abstract class LoginNavigator{
  void showMessage(String message,
      {String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle,
        VoidCallback? negAction,
        bool isDismissible = true});

  void showLoading();

  void hideLoading();
}