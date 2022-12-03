import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/data/dataproviders/user_api.dart';
import 'package:senjayer/data/enums/errors.dart';
import 'package:senjayer/data/models/actor.dart';
import 'package:senjayer/data/models/ticket.dart';
import 'package:senjayer/data/models/user.dart';
import 'package:senjayer/utils/handle_errors.dart';

class UserRepository {
  final UserAPI _userAPI = UserAPI();

  Future<Either<Errors, List<User>>> getUsers() async {
    List<User> users = [];
    try {
      final response = await _userAPI.getUsers();
      final responseData = jsonDecode(response.toString());
      users = (responseData["data"] as List<dynamic>)
          .map((element) => User.fromMap(element))
          .toList();

      return right(users);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }

  Future<Either<Errors, List<Actor>>> getUserFollowedActors() async {
    List<Actor> actorsFollowedByUser = [];
    try {
      final response = await _userAPI.getActorsFollowedByUser();
      final responseData = jsonDecode(response.toString());
      actorsFollowedByUser = (responseData["data"] as List<dynamic>)
          .map((element) => Actor.fromMap(element))
          .toList();

      return right(actorsFollowedByUser);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }

  Future<Either<Errors, List<Ticket>>> getUserTickets() async {
    List<Ticket> userTickets = [];
    try {
      final response = await _userAPI.getUserTickets();
      final responseData = jsonDecode(response.toString());
      userTickets = (responseData["data"] as List<dynamic>)
          .map((element) => Ticket.fromMap(element))
          .toList();

      return right(userTickets);
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }
}
