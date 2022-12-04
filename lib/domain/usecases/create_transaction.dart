import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/transaction_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class CreateTransaction {
  TransactionRepository repository;
  CreateTransaction(this.repository);

  Future<Either<Failure, void>> call(String token, String address) async {
    return await repository.createTransaction(token, address);
  }
}
