import 'dart:io';

import 'package:waroengku/domain/entity/category.dart';

abstract class ProductEvent {}

class ProductGet extends ProductEvent {
  String token;
  List<Category> categories;
  ProductGet({
    required this.token,
    required this.categories,
  });
}

class ProductCreate extends ProductEvent {
  String token, name, description;
  int categoryId, stock, price;
  File image;
  ProductCreate({
    required this.token,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.stock,
    required this.price,
    required this.image,
  });
}

class ProductEdit extends ProductEvent {
  String token, name, description;
  int id, categoryId, stock, price;
  File image;
  List<Category> categories;
  ProductEdit({
    required this.token,
    required this.name,
    required this.description,
    required this.id,
    required this.categoryId,
    required this.stock,
    required this.price,
    required this.image,
    required this.categories,
  });
}

class ProductDelete extends ProductEvent {
  String token;
  int id;
  List<Category> categories;
  ProductDelete({
    required this.token,
    required this.id,
    required this.categories,
  });
}
