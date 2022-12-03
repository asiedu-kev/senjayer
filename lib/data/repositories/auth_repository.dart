import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/data/dataproviders/auth_api.dart';
import 'package:senjayer/data/enums/errors.dart';
import 'package:senjayer/data/models/role.dart';
import 'package:senjayer/utils/handle_errors.dart';

class AuthRepository {
  final AuthAPI _authAPI = AuthAPI();

  Future<Either<Errors, List<Role>>> getRoles() async {
    List<Role> roles = [];
    try {
      final response = await _authAPI.getRoles();
      final responseData = jsonDecode(response.toString());
      roles = (responseData["data"] as List<dynamic>)
          .map((element) => Role.fromMap(element))
          .toList();
    return right(roles);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }

  Future<Either<Errors, Map<String, dynamic>>> register(
    String name,
    String phone,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    int? customerId;
    try {
      final rolesEither = await getRoles();
      rolesEither.fold(
        (error) {
          throw (error);
        },
        (roles) {
          customerId = roles
              .firstWhere(
                  (element) => element.name.toLowerCase().trim() == "customer")
              .id;
        },
      );
      log(customerId.toString());
      final response = await _authAPI.register(name, phone, email,
          customerId.toString(), password, passwordConfirmation);
      final responseData = jsonDecode(response.toString());
      log("registration success");
      return right(responseData);
    } on DioError catch (error) {
      log('DioError ${error.response!.data.toString()}');
      return handleDioError(error);
    } catch (e) {
      log("error: ${e.toString()}");
      return left(Errors.unexpected);
    }
  }

  Future<Either<Errors, Map<String, dynamic>>> login(
    String phone,
    String password,
  ) async {
    try {
      final response = await _authAPI.login(phone, password);
      final responseData = jsonDecode(response.toString());
      log("login success");
      return right(responseData);
    } on DioError catch (error) {
      log('DioError ${error.response!.data.toString()}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }
}
