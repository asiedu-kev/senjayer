import 'dart:developer';

import 'package:dio/dio.dart';

class AuthAPI {
  static String mainUrl = "https://back.senjayer.com";
  final Dio _dio = Dio();

  Future<Response> login(String phone, String password) async {
    String loginUrl = "$mainUrl/api/auth/phone-login";
    Response response = await _dio.post(loginUrl, data: {
      "phone": phone,
      "password": password,
    });
    return response;
  }

  Future<Response> register(
    String name,
    String phone,
    String email,
    String roleId,
    String password,
    String passwordConfirmation,
  ) async {
    String registerUrl = "$mainUrl/api/auth/register";
    Response response = await _dio.post(registerUrl, data: {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "role_id": roleId,
      "password_confirmation": passwordConfirmation
    });
    return response;
  }

  Future<Response> getRoles() async {
    String rolesUrl = "$mainUrl/api/v1/list-roles";
    log(rolesUrl);
    Response response = await _dio.get(rolesUrl);
    return response;
  }
}
