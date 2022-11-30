import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';

class EventsAPI {
  static String mainUrl = "https://back.senjayer.com";
  final LocalDataRepository localDataRepository = LocalDataRepository();
  final Dio _dio = Dio();

  Future<Response> getTopEvents() async {
    String topsUrl = "$mainUrl/api/v1/top-events";
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

  Future<Response> getTrendEvents() async {
    String trendsUrl = "$mainUrl/api/v1/trend-events";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      trendsUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> getAllEvents() async {
    String topsUrl = "$mainUrl/api/v1/events-with-all";
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

  Future<Response> getDayEvents() async {
    String trendsUrl = "$mainUrl/api/v1/day-events";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      trendsUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> getCategories() async {
    String categoriesUrl = "$mainUrl/api/v1/categories";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      categoriesUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> getCategoryWithEvents() async {
    String categoryEventsUrl = "$mainUrl/api/auth/categories-with-events";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      categoryEventsUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> getCategoryDetails(int categoryId) async {
    String categoryDetailUrl = "$mainUrl/api/v1/categories/$categoryId";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      categoryDetailUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> getUserDetails(int userId) async {
    String userUrl = "$mainUrl/api/v1/users/$userId";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      userUrl,
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
