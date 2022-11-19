import 'package:bloc/bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit()
      : super(CategoryState(
            currentIndex: 0, categories: ["Tout", "Expo", "Concert", "Gala"]));

  void setCategoryIndex(int index) =>
      emit(CategoryState(currentIndex: index, categories: state.categories));
}
