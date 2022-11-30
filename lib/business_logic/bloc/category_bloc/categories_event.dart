part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}


class CategoriesItemChanged extends CategoriesEvent {
  final int categoryId;
  CategoriesItemChanged({
    required this.categoryId,
  });
}