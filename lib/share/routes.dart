import 'package:flutter/material.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/presentation/pages/admin_pages/edit_katalog.dart';
import 'package:waroengku/presentation/pages/admin_pages/edit_kategori.dart';
import 'package:waroengku/presentation/pages/admin_pages/home_admin.dart';
import 'package:waroengku/presentation/pages/admin_pages/tambah_katalog.dart';
import 'package:waroengku/presentation/pages/admin_pages/tambah_kategori.dart';
import 'package:waroengku/presentation/pages/user_pages/checkout_page.dart';
import 'package:waroengku/presentation/pages/user_pages/keranjang_page.dart';
import 'package:waroengku/presentation/pages/user_pages/order_details.dart';
import 'package:waroengku/presentation/pages/user_pages/success_page.dart';

import '../presentation/pages/user_pages/detail_page.dart';
import '../presentation/pages/user_pages/dashboard/dashboard_page.dart';
import '../presentation/pages/user_pages/login/login_page.dart';
import '../presentation/pages/user_pages/splash_page.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";
const String dashboardPage = "dashboard-page";
const String detailPage = "detail-page";
const String homeAdmin = "home-admin";
const String tambahKategoriPage = "tambah-kategori";
const String tambahKatalogPage = "tambah-katalog";
const String editKategoriPage = "edit-kategori";
const String editKatalogPage = "edit-katalog";
const String keranjangPage = "keranjang-page";
const String orderDetailPage = "order-detail-page";
const String checkoutPage = "checkout-page";
const String successPage = "success-page'";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case successPage:
      return MaterialPageRoute(
        builder: (context) => SuccessPage(),
      );
    case checkoutPage:
      return MaterialPageRoute(
        builder: (context) => CheckoutPage(),
      );
    case orderDetailPage:
      return MaterialPageRoute(
        builder: (context) => OrderDetailsPage(),
      );
    case keranjangPage:
      return MaterialPageRoute(
        builder: (context) => KeranjangPage(),
      );
    case editKatalogPage:
      final args = settings.arguments as Product;
      return MaterialPageRoute(
        builder: (context) => EditKatalogPage(product: args),
      );
    case editKategoriPage:
      final args = settings.arguments as Category;
      return MaterialPageRoute(
        builder: (context) => EditKategoriPage(category: args),
      );
    case tambahKategoriPage:
      return MaterialPageRoute(
        builder: (context) => const TambahKategoriPage(),
      );
    case tambahKatalogPage:
      return MaterialPageRoute(
        builder: (context) => const TambahKatalog(),
      );
    case homeAdmin:
      final initialIndex = settings.arguments as int;
      return MaterialPageRoute(
        builder: (context) => HomeAdminPage(
          initialIndex: initialIndex,
        ),
      );
    case detailPage:
      final product = settings.arguments as Product;
      return MaterialPageRoute(
        builder: (context) => DetailPage(product: product),
      );
    case dashboardPage:
      return MaterialPageRoute(
        builder: (context) => DashboardPage(),
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
