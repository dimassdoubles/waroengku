import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/product_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class UpdateProduct {
  ProductRepository repository;
  UpdateProduct(this.repository);

  Future<Either<Failure, void>> call({
    required String token,
    required int id,
    required String name,
    required int categoryId,
    required File image,
    required int stock,
    required String description,
    required int price,
  }) async {
    return await repository.updateProduct(
      token,
      id,
      name,
      categoryId,
      image,
      stock,
      description,
      price,
    );
  }
}
