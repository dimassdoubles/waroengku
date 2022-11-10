import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/domain/entity/review.dart';
import 'package:waroengku/domain/repositories/product_repository.dart';
import 'package:waroengku/domain/usecases/get_review_by_product_id.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  MockProductRepository repository = MockProductRepository();
  GetReviewByProductId usecase = GetReviewByProductId(repository);

  List<Review> listReview = [];

  test(
    "should call repository.getReviewByProductId",
    () async {
      when(
        () => repository.getReviewByProductId(token: "token", productId: 1),
      ).thenAnswer(
        (invocation) async => Right(listReview),
      );
      final result = await usecase(token: "token", productId: 1);
      expect(result, Right(listReview));
      verify(
          () => repository.getReviewByProductId(token: "token", productId: 1));
      verifyNoMoreInteractions(repository);
    },
  );
}
