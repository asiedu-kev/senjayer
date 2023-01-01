import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/data/dataproviders/actors_api.dart';
import 'package:senjayer/data/enums/errors.dart';
import 'package:senjayer/data/models/actor.dart';
import 'package:senjayer/utils/handle_errors.dart';

class ActorsRepository{
  final ActorsAPI _actorsAPI = ActorsAPI();

  Future<Either<Errors, List<Actor>>> getActors() async {
    List<Actor> actors = [];
    try {
      final response = await _actorsAPI.getActors();
      //log(response.data["data"].toString());
      final responseData = jsonDecode(response.toString());
      actors = (responseData["data"] as List<dynamic>)
          .map((element) => Actor.fromMap(element))
          .toList();
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
    return right(actors);
  }
 
}
