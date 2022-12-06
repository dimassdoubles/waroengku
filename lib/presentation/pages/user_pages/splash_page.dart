import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:waroengku/injection_container.dart' as injection;
import 'package:lottie/lottie.dart';

import 'login_page.dart';

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
            Lottie.asset("assets/lotties/loading1.json",
                height: 200, width: 200),
            Text(
              "Waroengku",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade800),
            ),
          ],
        ),
        splashIconSize: 250,
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
