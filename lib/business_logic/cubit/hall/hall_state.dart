part of 'hall_cubit.dart';

@immutable
abstract class HallState {}

class HallIsFetching extends HallState {}

class HallFetched extends HallState {
  final List<Hall> halls;
  HallFetched({
    required this.halls,
  });
}

class HallFetchingFailed extends HallState {}

class HallIsEmpty extends HallState {}
