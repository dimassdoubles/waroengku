import 'package:dartz/dartz.dart';
import '../repositories/product_repository.dart';
import '../../share/errors/failures.dart';

import '../entity/review.dart';

class GetReviewByProductId {
  ProductRepository repository;
  GetReviewByProductId(this.repository);

  Future<Either<Failure, List<Review>>> call({
    required String token,
    required int productId,
  }) async {
    return await repository.getReviewByProductId(
      token: token,
      productId: productId,
    );
  }
}
