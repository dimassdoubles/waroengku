import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:waroengku/share/errors/failures.dart';

abstract class ReviewRepository {
  Future<Either<Failure, void>> createReview(
    String token,
    int productId,
    int star,
    String review,
    File image,
  );
  Future<Either<Failure, void>> deleteReview(String token, int id);
}
