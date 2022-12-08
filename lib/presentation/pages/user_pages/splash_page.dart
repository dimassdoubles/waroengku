import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../../injection_container.dart' as injection;

import '../../../share/styles/colors.dart';
import 'login/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen.withScreenFunction(
        screenFunction: () async {
          // menyiapkan dependency injection
          await injection.setUp();

          return const LoginPage();
        },
        splash: Column(
          children: [
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Image.asset(
                      "assets/images/app-logo.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(bottom: 32),
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}
