part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesIsFetching extends FavoritesState {}

class FavoritesFetched extends FavoritesState {
  final List<Favorite> favorites;
  FavoritesFetched({
    required this.favorites,
  });
}

class FavoritesFetchingFailed extends FavoritesState {}

class FavoritesIsEmpty extends FavoritesState {}
