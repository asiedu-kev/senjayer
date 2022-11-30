part of 'day_events_cubit.dart';

@immutable
abstract class DayEventsState {}

class DayEventsIsFetching extends DayEventsState {}

class DayEventsFetched extends DayEventsState {
  final List<Event> dayEvents;
  DayEventsFetched({
    required this.dayEvents,
  });
}

class DayEventsFetchingFailed extends DayEventsState {}

class DayEventsIsEmpty extends DayEventsState {}
