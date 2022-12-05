import 'package:flutter/material.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/presentation/pages/admin/edit_katalog.dart';
import 'package:waroengku/presentation/pages/admin/edit_kategori.dart';
import 'package:waroengku/presentation/pages/admin/home_admin.dart';
import 'package:waroengku/presentation/pages/admin/tambah_katalog.dart';
import 'package:waroengku/presentation/pages/admin/tambah_kategori.dart';
import 'package:waroengku/presentation/pages/detail_page.dart';
import 'package:waroengku/presentation/pages/login_page.dart';
import 'package:waroengku/presentation/pages/splash_page.dart';
import 'package:waroengku/presentation/pages/home_page.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";
const String homePage = "home-page";
const String detailPage = "detail-page";
const String homeAdmin = "home-admin";
const String tambahKategoriPage = "tambah-kategori";
const String tambahKatalogPage = "tambah-katalog";
const String editKategoriPage = "edit-kategori";
const String editKatalogPage = "edit-katalog";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
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
