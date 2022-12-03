import 'dart:io';

import 'package:dio/dio.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';

class UserAPI {
  static String mainUrl = "https://back.senjayer.com";
  final LocalDataRepository localDataRepository = LocalDataRepository();
  final Dio _dio = Dio();

  Future<Response> getUsers() async {
    String topsUrl = "$mainUrl/api/v1/users";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      topsUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

   Future<Response> getActorsFollowedByUser() async {
    String topsUrl = "$mainUrl/api/v1/my-follows";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      topsUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> getUserTickets() async {
    String topsUrl = "$mainUrl/api/v1/my-tickets";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      topsUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }
}
