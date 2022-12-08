import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../share/errors/failures.dart';

import '../repositories/review_repository.dart';

class CreateReview {
  ReviewRepository repository;
  CreateReview(this.repository);

  Future<Either<Failure, void>> call({
    required String token,
    required int productId,
    required int star,
    required String review,
    required File image,
  }) async {
    return await repository.createReview(token, productId, star, review, image);
  }
}
