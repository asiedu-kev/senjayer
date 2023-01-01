import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/data/repositories/events_repository.dart';

part 'trend_state.dart';

class TrendCubit extends Cubit<TrendState> {
  TrendCubit() : super(TrendIsFetching());

  void getTrendEvents() async {
    emit(TrendIsFetching());
    final EventsRepository eventsRepository = EventsRepository();
    final topEventEither = await eventsRepository.getTrendEvents();
    topEventEither.fold((error) => emit(TrendFetchingFailed()),
        (trendEvents) {
      if (trendEvents.isEmpty) {
        emit(TrendIsEmpty());
      } else {
        emit(TrendFetched(trendEvents: trendEvents));
      }
    });
  }
}
