part of 'actors_cubit.dart';

@immutable
abstract class ActorsState {}

class ActorsIsFetching extends ActorsState {}

class ActorsFetched extends ActorsState {
  final List<Actor> actors;
  ActorsFetched({
    required this.actors,
  });
}

class ActorsFetchingFailed extends ActorsState {}

class ActorsIsEmpty extends ActorsState {}