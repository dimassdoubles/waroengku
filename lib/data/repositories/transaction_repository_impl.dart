import 'package:waroengku/domain/entity/transaction.dart';
import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/transaction_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../../share/errors/exceptions.dart';
import '../data_sources/transaction/remote_data_source.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Transaction>>> getTransaction(
      String token) async {
    try {
      final result = await remoteDataSource.getTransaction(token);
      return Right(result);
    } on GetTransactionException catch (e) {
      return Left(GetTransactionFailure(e.message));
    }
  }
}
