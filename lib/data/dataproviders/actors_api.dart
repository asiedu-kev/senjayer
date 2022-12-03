import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';

class ActorsAPI {
  static String mainUrl = "https://back.senjayer.com";
  final LocalDataRepository localDataRepository = LocalDataRepository();
  final Dio _dio = Dio();

  Future<Response> getActors() async {
    String topsUrl = "$mainUrl/api/v1/actors";
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
