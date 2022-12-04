import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/transaction.dart';
import 'package:waroengku/share/errors/failures.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>> getTransaction(String token);
  Future<Either<Failure, void>> createTransaction(String token, String address);
}
