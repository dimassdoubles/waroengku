import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lottie/lottie.dart';
import 'package:waroengku/presentation/pages/signin_page.dart';
import 'package:waroengku/presentation/pages/signup_page.dart';
import 'package:waroengku/presentation/pages/splash_page.dart';
import 'package:waroengku/share/routes.dart';
import 'package:waroengku/share/styles/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late StreamSubscription<bool> keyboardSubscription;
  late KeyboardVisibilityController keyboardVisibilityController;

  @override
  void initState() {
    super.initState();
    keyboardVisibilityController = KeyboardVisibilityController();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            (keyboardVisibilityController.isVisible)
                ? const SizedBox()
                : Container(
                    child: Lottie.asset(
                        "assets/lotties/108403-customer-need.json"),
                  ),
            TabBar(
              controller: tabController,
              labelColor: kPrimaryColor,
              tabs: const [
                Tab(
                  text: ("Sign In"),
                ),
                Tab(
                  text: ("Sign Up"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  SignInPage(),
                  SignUpPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
