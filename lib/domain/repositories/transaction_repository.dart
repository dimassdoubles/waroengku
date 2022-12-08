import 'package:dartz/dartz.dart';
import '../entity/transaction.dart';
import '../../share/errors/failures.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>> getTransaction(String token);
  Future<Either<Failure, void>> createTransaction(String token, String address);
}
