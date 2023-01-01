import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/actor.dart';
import 'package:senjayer/data/repositories/user_repository.dart';

part 'actors_followed_by_user_state.dart';

class ActorsFollowedByUserCubit extends Cubit<ActorsFollowedByUserState> {
  ActorsFollowedByUserCubit() : super(ActorsFollowedByUserIsFetching());

  void getActorsFollowedByUser() async {
    final UserRepository userRepository = UserRepository();
    emit(ActorsFollowedByUserIsFetching());
    final getActorsFollowedByUser = await userRepository.getUserFollowedActors();
    getActorsFollowedByUser.fold((_){
      emit(ActorsFollowedByUserFetchingFailed());
    }, (actorsFollowedByUserActors){
      emit(ActorsFollowedByUserFetched(actorsFollowedByUserActors: actorsFollowedByUserActors));
    });
  }
}