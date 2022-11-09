import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/category/remote_data_source.dart';
import 'package:waroengku/data/data_sources/user/remote_data_source.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/share/errors/exceptions.dart';

void main() {
  UserRemoteDataSourceImpl userRemoteDataSource = UserRemoteDataSourceImpl();
  const String email = "kelompok1@gmail.com";
  const String password = "kelompok1";

  const String adminEmail = "admin@admin.com";
  const String adminPassword = "admin123";

  CategoryRemoteDataSourceImpl remoteDataSource =
      CategoryRemoteDataSourceImpl();

  group(
    "getCategories",
    () {
      test(
        "should success",
        () async {
          final user = await userRemoteDataSource.login(
            email: email,
            password: password,
          );
          final token = user.token;

          try {
            final result = await remoteDataSource.getCategories(token);
            expect(result, isA<List<Category>>());
          } on GetCategoriesException {
            expect("berhasil", "gagal");
          }
        },
      );
      test(
        "should fail",
        () async {
          try {
            await remoteDataSource.getCategories("token");
            expect("gagal", "berhasil");
            // ignore: empty_catches
          } on GetCategoriesException {}
        },
      );
    },
  );

  group(
    "createCategory",
    () {
      test(
        "should fail when user role is not admin",
        () async {
          final user = await userRemoteDataSource.login(
            email: email,
            password: password,
          );
          final token = user.token;
          try {
            await remoteDataSource.createCategory(token: token, name: "name");
            expect("gagal", "berhasil");
            // ignore: empty_catches
          } on NoAuthorizationException {}
        },
      );

      test(
        "should success",
        () async {
          final user = await userRemoteDataSource.login(
            email: adminEmail,
            password: adminPassword,
          );
          final token = user.token;
          try {
            await remoteDataSource.createCategory(token: token, name: "name");
          } on NoAuthorizationException {
            expect("berhasil", "gagal");
          }
        },
      );
    },
  );
}
