import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:waroengku/presentation/pages/user_pages/dashboard/dashboard_screens/wishlist_screen.dart';
import 'package:waroengku/share/styles/colors.dart';

import 'dashboard_screens/home_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int navIndex = 0;

  Widget returnScreen(int navIndex) {
    switch (navIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return WishlistScreen();
      case 2:
        return HomeScreen();
      case 3:
        return WishlistScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: returnScreen(navIndex),
      bottomNavigationBar: FloatingNavbar(
        onTap: (val) {
          setState(() {
            navIndex = val;
          });
        },
        borderRadius: 25,
        itemBorderRadius: 25,
        currentIndex: navIndex,
        backgroundColor: kPrimaryColor,
        selectedItemColor: kPrimaryColor,
        items: [
          FloatingNavbarItem(
            icon: Icons.home,
          ),
          FloatingNavbarItem(
            icon: Icons.favorite,
          ),
          FloatingNavbarItem(
            icon: Icons.receipt_rounded,
          ),
          FloatingNavbarItem(
            icon: Icons.person,
          ),
        ],
      ),
    );
  }
}
