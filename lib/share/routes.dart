import 'package:flutter/material.dart';
import 'package:waroengku/presentation/pages/login_page.dart';
import 'package:waroengku/presentation/pages/splash_page.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
    case splashPage:
      return MaterialPageRoute(
        builder: (context) => const SplashPage(),
      );
    default:
      throw ("This route name doesn't exist");
  }
}
