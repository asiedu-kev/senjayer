import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/actor.dart';
import 'package:senjayer/data/repositories/actors_repository.dart';

part 'actors_state.dart';

class ActorsCubit extends Cubit<ActorsState> {
  ActorsCubit() : super(ActorsIsFetching());

  void getActors() async {
    final ActorsRepository actorsRepository = ActorsRepository();
    emit(ActorsIsFetching());
    final getActorsEither = await actorsRepository.getActors();
    getActorsEither.fold((_) {
      emit(ActorsFetchingFailed());
    }, (actors) {
      if (actors.isEmpty) {
        emit(ActorsIsEmpty());
      } else {
        emit(ActorsFetched(actors: actors));
      }
    });
  }
}
