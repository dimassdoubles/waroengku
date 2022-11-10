import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/product/remote_data_source.dart';
import 'package:waroengku/data/data_sources/user/remote_data_source.dart';
import 'package:waroengku/share/errors/exceptions.dart';

void main() {
  UserRemoteDataSourceImpl userRemoteDataSourceImpl =
      UserRemoteDataSourceImpl();
  ProductRemoteDataSourceImpl remoteDataSource = ProductRemoteDataSourceImpl();

  const String email = "kelompok1@gmail.com";
  const String password = "kelompok1";

  group(
    "getProductByCategory",
    () {
      test(
        "should throw NotFoundException when category id is not found",
        () async {
          final user = await userRemoteDataSourceImpl.login(
            email: email,
            password: password,
          );
          final token = user.token;
          try {
            await remoteDataSource.getProductByCategory(
              token: token,
              categoryId: 100,
            );
            expect("sukses", "gagal");
            // ignore: empty_catches
          } on NotFoundException {}
        },
      );

      test(
        "should throw NoAuthenticationException when token is not valid",
        () async {
          try {
            await remoteDataSource.getProductByCategory(
              token: "token",
              categoryId: 1,
            );
            expect("sukses", "gagal");
            // ignore: empty_catches
          } on NoAuthorizationException {}
        },
      );

      test(
        "should success",
        () async {
          final user = await userRemoteDataSourceImpl.login(
            email: email,
            password: password,
          );
          final token = user.token;
          try {
            await remoteDataSource.getProductByCategory(
              token: token,
              categoryId: 1,
            );
          } on NotFoundException {
            expect("gagal", "sukses");
          }
        },
      );
    },
  );
}
