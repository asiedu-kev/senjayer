part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserIsFetching extends UserState {}

class UserFetched extends UserState {
  final User user;
  UserFetched({
    required this.user,
  });
}

class UserFetchingFailed extends UserState {}
