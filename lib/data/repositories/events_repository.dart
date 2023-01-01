import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/data/dataproviders/events_api.dart';
import 'package:senjayer/data/enums/errors.dart';
import 'package:senjayer/data/models/actor.dart';
import 'package:senjayer/data/models/category.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/utils/handle_errors.dart';

class EventsRepository {
  final EventsAPI _eventAPI = EventsAPI();

  Future<Either<Errors, List<Event>>> getTopEvents() async {
    List<Event> events = [];
    try {
      final response = await _eventAPI.getTopEvents();
      final responseData = jsonDecode(response.toString());
      events = (responseData["data"] as List<dynamic>)
          .map((element) => Event.fromMap(element["event"]))
          .toList();
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
    return right(events);
  }

  Future<Either<Errors, List<Event>>> getTrendEvents() async {
    List<Event> events = [];
    try {
      final response = await _eventAPI.getTrendEvents();
      final responseData = jsonDecode(response.toString());
      log(responseData.toString());
      events = (responseData["data"] as List<dynamic>)
          .map((element) => Event.fromMap(element["event"]))
          .toList();
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
    log(events.toString());
    return right(events);
  }

  Future<Either<Errors, List<Event>>> getAllEvents() async {
    List<Event> events = [];
    try {
      final response = await _eventAPI.getAllEvents();
      final responseData = jsonDecode(response.toString());
      events = (responseData["data"] as List<dynamic>)
          .map((element) => Event.fromMap(element))
          .toList();
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
    log(events.toString());
    return right(events);
  }

  Future<Either<Errors, List<Event>>> getDayEvents() async {
    List<Event> events = [];
    try {
      final response = await _eventAPI.getDayEvents();
      final responseData = jsonDecode(response.toString());
      events = (responseData["data"] as List<dynamic>)
          .map((element) => Event.fromMap(element))
          .toList();
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
    log(events.toString());
    return right(events);
  }

  Future<Either<Errors, List<Category>>> getCategories() async {
    List<Category> categories = [];
    try {
      final response = await _eventAPI.getCategories();
      final responseData = jsonDecode(response.toString());
      categories = (responseData["data"] as List<dynamic>)
          .map((element) => Category.fromMap(element))
          .toList();
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
    return right(categories);
  }

  Future<Either<Errors, List<Event>>> getCategoryEvents(int categoryId) async {
    List<Event> events = [];
    try {
      final response = await _eventAPI.getCategoryWithEvents();
      final responseData = jsonDecode(response.toString());
      for (var element in (responseData["data"] as List<dynamic>)) {
        if (element["id"] != null) {
          if (element["id"] == categoryId) {
            if (element['events'] != null) {
              events = (element['events'] as List<dynamic>)
                  .map((event) => Event.fromMap(event))
                  .toList();
            }
          }
        }
      }
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
    return right(events);
  }

  Future<Either<Errors, Category>> getCategoryDetails(int categoryId) async {
    try {
      final response = await _eventAPI.getCategoryDetails(categoryId);
      final responseData = jsonDecode(response.toString());
      log(responseData["data"].toString());
      return right(Category.fromMap(responseData["data"]));
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }

  Future<Either<Errors, Actor>> getUserDetails(int userId) async {
    try {
      final response = await _eventAPI.getUserDetails(userId);
      final responseData = jsonDecode(response.toString());
      log(responseData["data"].toString());
      //TODO: Handle difference between user and actor
      return right(Actor.fromUserMap(responseData["data"]));
    } on DioError catch (error) {
      log('DioError ${error.message}');
      return handleDioError(error);
    } catch (e) {
      log(e.toString());
      return left(Errors.unexpected);
    }
  }
}
