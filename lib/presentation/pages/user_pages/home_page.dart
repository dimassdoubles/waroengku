import 'package:flutter/material.dart';

import 'home_screens/home_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const HomeScreen(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Transaksi',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
