import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/data/repositories/events_repository.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesItemChanged>((event, emit) async {
      final EventsRepository eventsRepository = EventsRepository();
      emit(CategoriesFetching());
      final getCategoryEventsEither =
          await eventsRepository.getCategoryEvents(event.categoryId);
      getCategoryEventsEither.fold((error){
        emit(CategoriesFetchingFailed());
      }, (events){
        if(events.isEmpty){
          emit(CategoriesIsEmpty());
        }else{
          emit(CategoriesEventsFetched(categorieEvents: events));
        }
      });
    });
  }
}
