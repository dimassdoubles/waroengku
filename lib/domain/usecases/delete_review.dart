import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/review_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class DeleteReview {
  ReviewRepository repository;
  DeleteReview(this.repository);

  Future<Either<Failure, void>> call(String token, int id) async {
    return await repository.deleteReview(token, id);
  }
}
