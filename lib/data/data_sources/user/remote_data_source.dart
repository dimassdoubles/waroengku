import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:waroengku/share/const/base_url.dart';
import 'package:waroengku/share/errors/exceptions.dart';

abstract class UserRemoteDataSource {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    const String endPoint = "$baseUrl/api/register";
    final body = {
      "name": name,
      "email": email,
      "handphone": phone,
      "password": password,
      "password_confirmation": password,
    };

    try {
      final response = await Dio().post(endPoint, data: body);
    } on DioError catch (e) {
      Map<String, dynamic> errorResponse = jsonDecode(e.response.toString());

      if (errorResponse["code"] == "-1") {
        String errorMessage = "";
        String emailError = "";
        String phoneError = "";
        try {
          emailError = errorResponse["data"]["errors"]["email"][0];
          // ignore: empty_catches
        } catch (e) {}

        try {
          phoneError = errorResponse["data"]["errors"]["handphone"][0];
          // ignore: empty_catches
        } catch (e) {}

        if (emailError == "") {
          errorMessage = phoneError;
        } else {
          if (phoneError != "") {
            errorMessage = "${emailError.replaceAll(".", "")} and $phoneError";
          } else {
            errorMessage = emailError;
          }
        }

        throw RegisterException(errorMessage);
      }
    }
  }
}
