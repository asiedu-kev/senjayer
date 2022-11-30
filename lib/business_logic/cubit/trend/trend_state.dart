part of 'trend_cubit.dart';

@immutable
abstract class TrendState {}

class TrendIsFetching extends TrendState {}

class TrendFetched extends TrendState {
  final List<Event> trendEvents;
  TrendFetched({
    required this.trendEvents,
  });
}

class TrendFetchingFailed extends TrendState {}

class TrendIsEmpty extends TrendState {}
