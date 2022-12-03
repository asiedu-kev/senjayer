part of 'actors_followed_by_user_cubit.dart';

@immutable
abstract class ActorsFollowedByUserState {}

class ActorsFollowedByUserIsFetching extends ActorsFollowedByUserState {}

class ActorsFollowedByUserFetched extends ActorsFollowedByUserState {
  final List<Actor> actorsFollowedByUserActors;
  ActorsFollowedByUserFetched({
    required this.actorsFollowedByUserActors,
  });
}

class ActorsFollowedByUserFetchingFailed extends ActorsFollowedByUserState {}
