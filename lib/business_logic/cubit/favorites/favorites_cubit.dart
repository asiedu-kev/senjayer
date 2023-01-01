import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/favorite.dart';
import 'package:senjayer/data/repositories/favorites_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesIsFetching());

  void getFavorites() async {
    final FavoritesRepository favoritesRepository = FavoritesRepository();
    emit(FavoritesIsFetching());
    final getFavoritesEither = await favoritesRepository.getFavorites();
    getFavoritesEither.fold((_) {
      emit(FavoritesFetchingFailed());
    }, (favorites) {
      if (favorites.isEmpty) {
        emit(FavoritesIsEmpty());
      } else {
        emit(FavoritesFetched(favorites: favorites));
      }
    });
  }

  void removeFromFavorites(Favorite favorite) async {
    if (state is FavoritesFetched) {
      List<Favorite> remainingFavorites = (state as FavoritesFetched).favorites;
      final bool doesItemExist = remainingFavorites.remove(favorite);
      if (remainingFavorites.isEmpty) {
        emit(FavoritesIsEmpty());
      } else {
        emit(FavoritesFetched(favorites: remainingFavorites));
      }
      if (doesItemExist) {
        final FavoritesRepository favoritesRepository = FavoritesRepository();
        final removeFromFavoritesEither =
            await favoritesRepository.removeFavorites(favorite.id);
        removeFromFavoritesEither.fold((_) {
          List<Favorite> finalFavorites = (state as FavoritesFetched).favorites;
          finalFavorites.add(favorite);
          emit(FavoritesFetched(favorites: finalFavorites));
        }, (_) {});
      }
    }
  }

  void favoriteEvent(int eventId) async {
    final FavoritesRepository favoritesRepository = FavoritesRepository();
    final favoriteEventEither =
        await favoritesRepository.favoriteEvent(eventId);
    favoriteEventEither.fold((_) {}, (r) {});
  }

  bool isFavorite(int eventId){
    if(state is FavoritesFetched){
      try {
        (state as FavoritesFetched).favorites.firstWhere((favorite) => favorite.eventId == eventId);
        return true;
      } catch (e) {
        return false;
      }
    }else{
      return false;
    }
  }
}
