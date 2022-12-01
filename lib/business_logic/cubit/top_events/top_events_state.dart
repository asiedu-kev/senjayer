part of 'top_events_cubit.dart';

@immutable
abstract class TopEventsState {}

class TopIsFetching extends TopEventsState {}

class TopFetched extends TopEventsState {
  final List<Event> topEvents;
  TopFetched({
    required this.topEvents,
  });
}

class TopFetchingFailed extends TopEventsState {}

class TopIsEmpty extends TopEventsState {}
