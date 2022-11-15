import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit()
      : super(
          MainScreenState(
            pageIndex: 0,
            menuIconsPath: [
              "assets/icons/home.png",
              "assets/icons/news.png",
              "assets/icons/events.png",
              "assets/icons/location.png",
              "assets/icons/client-management.png",
            ],
          ),
        );

  void changePage(int index, PageController pageController) {
    if (index >= 0 && index < 5) {
      emit(
        MainScreenState(
          pageIndex: index,
          menuIconsPath: state.menuIconsPath,
        ),
      );
      pageController.jumpToPage(index);
    } else {
      emit(
        MainScreenState(
          pageIndex: 0,
          menuIconsPath: state.menuIconsPath,
        ),
      );
      pageController.jumpToPage(0);
    }
  }
}
