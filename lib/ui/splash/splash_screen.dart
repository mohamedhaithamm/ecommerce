import 'dart:async';

import 'package:e_commerce/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../register/register_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_screen';
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushNamed(LoginScreen.routeName);
      },
    );
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
