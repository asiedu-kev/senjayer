import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/data/repositories/events_repository.dart';

part 'day_events_state.dart';

class DayEventsCubit extends Cubit<DayEventsState> {
  DayEventsCubit() : super(DayEventsIsFetching());

  void getDayEvents() async {
    emit(DayEventsIsFetching());
    final EventsRepository eventsRepository = EventsRepository();
    final topEventEither = await eventsRepository.getDayEvents();
    topEventEither.fold((error) => emit(DayEventsFetchingFailed()),
        (dayEvents) {
      if (dayEvents.isEmpty) {
        emit(DayEventsIsEmpty());
      } else {
        emit(DayEventsFetched(dayEvents: dayEvents));
      }
    });
  }
}
