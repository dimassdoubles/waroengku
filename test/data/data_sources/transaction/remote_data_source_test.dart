import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/transaction/remote_data_source.dart';
import 'package:waroengku/domain/entity/transaction.dart';
import 'package:waroengku/domain/usecases/create_transaction.dart';

import '../../../const/token.dart';

void main() {
  TransactionRemoteDataSource remoteDataSource =
      TransactionRemoteDataSourceImpl();

  group(
    "getTransaction",
    () {
      test(
        "should return list transaction",
        () async {
          final result = await remoteDataSource.getTransaction(validUserToken);
          expect(result, isA<List<Transaction>>());
        },
      );
    },
  );

  group(
    "createTransaction",
    () {
      test(
        "should return void",
        () async {
          try {
            await remoteDataSource.createTransaction(validUserToken, "Rumah");
          } on CreateTransaction {
            expect("fail", "success");
          }
        },
      );
    },
  );
}
