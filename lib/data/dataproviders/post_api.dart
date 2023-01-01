import 'dart:io';

import 'package:dio/dio.dart';
import 'package:senjayer/data/models/comment.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';

class PostAPI {
  static String mainUrl = "https://back.senjayer.com";
  final LocalDataRepository localDataRepository = LocalDataRepository();
  final Dio _dio = Dio();

  Future<Response> getPosts() async {
    String topsUrl = "$mainUrl/api/v1/posts";
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

  Future<Response> commentPost(Comment comment) async {
    String commentsUrl = "$mainUrl/api/v1/comments";
    final token = await localDataRepository.getToken();
    Response response = await _dio.post(
      commentsUrl,
      data: comment.toMap(),
      options: Options(
        contentType: "application/json",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> getComments() async {
    String commentsUrl = "$mainUrl/api/v1/comments";
    final token = await localDataRepository.getToken();
    Response response = await _dio.get(
      commentsUrl,
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
