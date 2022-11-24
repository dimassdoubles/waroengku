import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/product_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class CreateProduct {
  ProductRepository repository;
  CreateProduct(this.repository);

  Future<Either<Failure, void>> call({
    required String token,
required    String name,
required    int categoryId,
required    File image,
 required   int stock,
 required   String description,
 required   int price,
  }) async {
    return await repository.createProduct(
      token,
      name,
      categoryId,
      image,
      stock,
      description,
      price,
    );
  }
}
