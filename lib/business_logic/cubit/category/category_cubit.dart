import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/business_logic/bloc/category_bloc/categories_bloc.dart';
import 'package:senjayer/data/models/category.dart';
import 'package:senjayer/data/repositories/events_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoriesBloc categoriesBloc;
  CategoryCubit({
    required this.categoriesBloc,
  }) : super(CategoryFetching());

  void fetchCategories() async {
    final EventsRepository eventsRepository = EventsRepository();
    emit(CategoryFetching());
    final getCategoresEither = await eventsRepository.getCategories();
    getCategoresEither.fold(
      (error) {
        log(error.toString());
        emit(CategoryFetchingFailed());
      },
      (categories) {
        if (categories.isEmpty) {
          emit(CategoryIsEmpty());
        } else {
          categories.insert(0, Category(name: 'Tout', id: 0, description: ""));
          emit(CategoryFetched(currentIndex: 0, categories: categories));
        }
      },
    );
  }

  void setCategoryIndex(int index) {
    if (state is CategoryFetched) {
      if ((state as CategoryFetched).currentIndex != index) {
        emit(
          CategoryFetched(
            currentIndex: index,
            categories: (state as CategoryFetched).categories,
          ),
        );
        if (index != 0) {
          if (categoriesBloc.state is CategoriesEventsFetched) {}
          categoriesBloc.add(
            CategoriesItemChanged(
                categoryId: (state as CategoryFetched).categories[index].id),
          );
        }
      }
    }
  }
}
