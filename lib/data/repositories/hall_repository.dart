import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/data/dataproviders/hall_api.dart';
import 'package:senjayer/data/enums/errors.dart';
import 'package:senjayer/data/models/hall.dart';
import 'package:senjayer/utils/handle_errors.dart';

class HallRepository {
  final HallAPI _postAPI = HallAPI();

  Future<Either<Errors, List<Hall>>> getHalls() async {
    List<Hall> halls = [];
    try {
      final response = await _postAPI.getHalls();
      final responseData = jsonDecode(response.toString());
      halls = (responseData["data"] as List<dynamic>)
          .map((element) => Hall.fromMap(element))
          .toList();

      return right(halls);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }
}
