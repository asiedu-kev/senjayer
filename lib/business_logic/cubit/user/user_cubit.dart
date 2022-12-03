import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:senjayer/data/models/user.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';
import 'package:senjayer/data/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserIsFetching());

  void getUser() async {
    final UserRepository userRepository = UserRepository();
    final LocalDataRepository localDataRepository = LocalDataRepository();
    log("fetchingUser");
    emit(UserIsFetching());
    final String phone = await localDataRepository.getPhone();
    final getUsersEither = await userRepository.getUsers();
    getUsersEither.fold(
      (_) {
        emit(UserFetchingFailed());
      },
      (users) {
        if (users.isEmpty) {
          emit(UserFetchingFailed());
        } else {
          final user = users.firstWhere((user) => user.phone == phone);
          emit(UserFetched(user: user));
        }
      },
    );
  }
}
