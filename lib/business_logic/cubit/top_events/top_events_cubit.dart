import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/data/repositories/events_repository.dart';

part 'top_events_state.dart';

class TopEventsCubit extends Cubit<TopEventsState> {
  TopEventsCubit() : super(TopIsFetching());

  void getTopEvents() async {
    emit(TopIsFetching());
    final EventsRepository eventsRepository = EventsRepository();
    final topEventEither = await eventsRepository.getTopEvents();
    topEventEither.fold((error) => emit(TopFetchingFailed()), (topEvents) {
      if (topEvents.isEmpty) {
        emit(TopIsEmpty());
      } else {
        emit(TopFetched(topEvents: topEvents));
      }
    });
  }
}
