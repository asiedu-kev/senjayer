import 'dart:io';

import 'package:dio/dio.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';

class FavoritesAPI {
  static String mainUrl = "https://back.senjayer.com";
  final LocalDataRepository localDataRepository = LocalDataRepository();
  final Dio _dio = Dio();

  Future<Response> favoriteEvent(int eventId) async {
    String favoritesUrl = "$mainUrl/api/v1/favorites/add-favorite";
    final token = await localDataRepository.getToken();
    Response response = await _dio.post(
      favoritesUrl,
      data: {
        'event_id': eventId,
      },
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> getFavorites() async {
    String favoritesUrl = "$mainUrl/api/v1/user-favorites";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      favoritesUrl,
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> removeFavorites(int favoriteId) async {
    String favoritesUrl = "$mainUrl/api/v1/my-tickets/$favoriteId";
    final token = await localDataRepository.getToken();
    Response response = await _dio.delete(
      favoritesUrl,
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
