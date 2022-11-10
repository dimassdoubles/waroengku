import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/product/remote_data_source.dart';
import 'package:waroengku/data/data_sources/user/remote_data_source.dart';
import 'package:waroengku/share/errors/exceptions.dart';

void main() async {
  UserRemoteDataSourceImpl userRemoteDataSourceImpl =
      UserRemoteDataSourceImpl();
  ProductRemoteDataSourceImpl remoteDataSource = ProductRemoteDataSourceImpl();

  const String email = "kelompok1@gmail.com";
  const String password = "kelompok1";

  final user = await userRemoteDataSourceImpl.login(
    email: email,
    password: password,
  );
  final token = user.token;

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

  group(
    "getReviewByProductId",
    () {
      test(
        "should throw NotFoundException when product id is not found",
        () async {
          try {
            await remoteDataSource.getReviewByProductId(
              token: token,
              productId: -1,
            );
            expect("sukses", "gagal");
            // ignore: empty_catches
          } on NotFoundException {
          } on NoAuthorizationException {
            expect("NoAuthorException", "NotFoundException");
          }
        },
      );

      test(
        "should throw NoAuthorizationException when token is not valid",
        () async {
          try {
            await remoteDataSource.getReviewByProductId(
                token: "token", productId: 1);
            expect("sukses", "gagal");
          } on NotFoundException {
            expect("NotFoundException", "NoAuthorizationException");
          } on NoAuthorizationException {}
        },
      );
      test(
        "should return list review",
        () async {
          try {
            await remoteDataSource.getReviewByProductId(
              token: token,
              productId: 3,
            );
          } catch (e) {
            expect("gagal", "sukses");
          }
        },
      );
    },
  );
}
