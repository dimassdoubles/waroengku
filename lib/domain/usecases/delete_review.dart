import 'package:dartz/dartz.dart';
import '../repositories/review_repository.dart';
import '../../share/errors/failures.dart';

class DeleteReview {
  ReviewRepository repository;
  DeleteReview(this.repository);

  Future<Either<Failure, void>> call(String token, int id) async {
    return await repository.deleteReview(token, id);
  }
}
