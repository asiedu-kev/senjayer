import 'dart:io';

import 'package:dio/dio.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';

class HallAPI {
  static String mainUrl = "https://back.senjayer.com";
  final LocalDataRepository localDataRepository = LocalDataRepository();
  final Dio _dio = Dio();

  Future<Response> getHalls() async {
    String hallsUrl = "$mainUrl/api/v1/salles";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      hallsUrl,
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
