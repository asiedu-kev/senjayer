import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/data/dataproviders/favorites_api.dart';
import 'package:senjayer/data/enums/errors.dart';
import 'package:senjayer/data/models/favorite.dart';
import 'package:senjayer/utils/handle_errors.dart';

class FavoritesRepository {
  final FavoritesAPI _favoritesAPI = FavoritesAPI();

  Future<Either<Errors, Unit>> favoriteEvent(int eventId) async {
    try {
      await _favoritesAPI.favoriteEvent(eventId);
      return right(unit);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }

  Future<Either<Errors, List<Favorite>>> getFavorites() async {
    List<Favorite> favorites = [];
    try {
      final response = await _favoritesAPI.getFavorites();
      final responseData = jsonDecode(response.toString());
      favorites = (responseData["data"] as List<dynamic>)
          .map((element) => Favorite.fromMap(element))
          .toList();
      return right(favorites);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }

  Future<Either<Errors, Unit>> removeFavorites(int favoriteId) async {
    try {
      await _favoritesAPI.removeFavorites(favoriteId);
      return right(unit);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }
}
