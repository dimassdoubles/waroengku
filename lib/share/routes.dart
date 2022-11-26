import 'dart:js';

import 'package:flutter/material.dart';
import 'package:waroengku/presentation/detail_page.dart';
import 'package:waroengku/presentation/pages/login_page.dart';
import 'package:waroengku/presentation/pages/splash_page.dart';
import 'package:waroengku/presentation/pages/home_page.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";
const String homePage = "home-page";
const String detailPage = "detail-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case detailPage:
      return MaterialPageRoute(
        builder: (context) => const DetailPage(),
      );
    case homePage:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
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
