import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../repositories/review_repository.dart';

class CreateReview {
  ReviewRepository repository;
  CreateReview(this.repository);

  Future<Either<Failure, void>> call(
      String token, int productId, int star, String review, File image) async {
    return await repository.createReview(token, productId, star, review, image);
  }
}
