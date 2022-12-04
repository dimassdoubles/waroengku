import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/transaction.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../repositories/transaction_repository.dart';

class GetTransaction {
  TransactionRepository repository;

  GetTransaction(this.repository);

  Future<Either<Failure, List<Transaction>>> call(String token) async {
    return await repository.getTransaction(token);
  }
}
