import 'package:dartz/dartz.dart';
import 'dart:io';

import 'package:waroengku/domain/repositories/review_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../../share/errors/exceptions.dart';
import '../data_sources/review/remote_data_source.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  ReviewRemoteDataSource remoteDataSource;
  ReviewRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, void>> createReview(
    String token,
    int productId,
    int star,
    String review,
    File image,
  ) async {
    try {
      await remoteDataSource.createReview(
        token,
        productId,
        star,
        review,
        image,
      );

      return const Right(null);
    } on CreateReviewException catch (e) {
      return Left(CreateReviewFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReview(String token, int id) async {
    try {
      await remoteDataSource.deleteReview(token, id);
      return const Right(null);
    } on DeleteReviewException catch (e) {
      return Left(DeleteReviewFailure(e.message));
    }
  }
}
