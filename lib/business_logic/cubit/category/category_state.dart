part of 'category_cubit.dart';

@immutable
abstract class CategoryState { 
}

class CategoryFetching extends CategoryState {
}

class CategoryFetched extends CategoryState {
  
  final int currentIndex;
  final List<Category> categories;
  CategoryFetched({
    required this.currentIndex,
    required this.categories,
  });
}

class CategoryFetchingFailed extends CategoryState {}

class CategoryIsEmpty extends CategoryState {}
