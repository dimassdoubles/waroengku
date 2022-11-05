import 'package:flutter/material.dart';
import 'package:waroengku/share/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, loginPage);
          },
          child: const Text('Splash Page to Login Page'),
        ),
      ),
    );
  }
}
