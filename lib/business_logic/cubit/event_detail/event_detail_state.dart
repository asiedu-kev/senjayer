part of 'event_detail_cubit.dart';

@immutable
abstract class EventDetailState {}

class EventDetailFetching extends EventDetailState {
}

class EventDetailFetched extends EventDetailState {
  
  final Category category;
  final Actor actor;
  EventDetailFetched({
    required this.category,
    required this.actor,
  });
}

class EventDetailFetchingFailed extends EventDetailState {}