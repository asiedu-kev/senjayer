import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/data/dataproviders/post_api.dart';
import 'package:senjayer/data/enums/errors.dart';
import 'package:senjayer/data/models/post.dart';
import 'package:senjayer/utils/handle_errors.dart';

class PostRepository {
  final PostAPI _postAPI = PostAPI();

  Future<Either<Errors, List<Post>>> getPosts() async {
    List<Post> posts = [];
    try {
      final response = await _postAPI.getPosts();
      final responseData = jsonDecode(response.toString());
      posts = (responseData["data"] as List<dynamic>)
          .map((element) => Post.fromMap(element))
          .toList();

      return right(posts);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }
}
