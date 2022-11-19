import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'room_category_state.dart';

class RoomCategoryCubit extends Cubit<RoomCategoryState> {
  RoomCategoryCubit()
      : super(
          RoomCategoryState(
            currentIndex: 0,
            categories: ["Tout", "Concert", "Divertissement"],
          ),
        );

  void setCategoryIndex(int index) => emit(
      RoomCategoryState(currentIndex: index, categories: state.categories));
}
