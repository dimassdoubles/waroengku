import 'package:flutter/material.dart';
import 'package:waroengku/share/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, loginPage);
          },
          child: Text('Login to Home Page'),
        ),
      ),
    );
  }
}
