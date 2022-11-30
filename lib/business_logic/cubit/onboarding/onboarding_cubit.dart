import 'package:bloc/bloc.dart';
import 'package:senjayer/data/models/onboarding_item.dart';

part 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState(index: 0, items: onBoardingItems));

  void goToNextItem() => emit(
        OnBoardingState(
          index: state.index == state.items.length - 1
              ? state.index
              : state.index + 1,
          items: state.items,
        ),
      );
}
