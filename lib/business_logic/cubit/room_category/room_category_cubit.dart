import 'package:flutter_bloc/flutter_bloc.dart';

part 'room_category_state.dart';

class HallCategoryCubit extends Cubit<HallCategoryState> {
  HallCategoryCubit()
      : super(
          HallCategoryState(
            currentIndex: 0,
            categories: ["Tout", "Concert", "Divertissement"],
          ),
        );

  void setCategoryIndex(int index) => emit(
      HallCategoryState(currentIndex: index, categories: state.categories));
}
