part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesEventsFetched extends CategoriesState {
  final List<Event> categorieEvents;
  CategoriesEventsFetched({
    required this.categorieEvents,
  });
}

class CategoriesFetching extends CategoriesState {}

class CategoriesFetchingFailed extends CategoriesState {}

class CategoriesIsEmpty extends CategoriesState {}
