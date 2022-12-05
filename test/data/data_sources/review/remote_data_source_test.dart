import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/review/remote_data_source.dart';
import 'package:waroengku/share/errors/exceptions.dart';

import '../../../const/token.dart';

void main() {
  ReviewRemoteDataSource remoteDataSource = ReviewRemoteDataSourceImpl();

  group(
    "deleteReview",
    () {
      test(
        "should return void",
        () async {
          try {
            await remoteDataSource.deleteReview(validUserToken, 15);
            expect("success", "success");
          } on DeleteReviewException {
            expect("fail", "success");
          }
        },
      );
    },
  );
}
