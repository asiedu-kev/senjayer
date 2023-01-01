import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/user.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserIsFetching());

  void getUser() async {
    final LocalDataRepository localDataRepository = LocalDataRepository();
    log("fetchingUser");
    emit(UserIsFetching());
    try {
    final User user = await localDataRepository.getUser();
    emit(UserFetched(user: user));
    } catch (e) {
      emit(UserFetchingFailed());
    }
  }
}
