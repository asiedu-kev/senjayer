import 'package:bloc/bloc.dart';
import 'package:senjayer/data/models/onboarding_item.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(index: 0, items: onboardingItems));

  void goToNextItem() => emit(
        OnboardingState(
          index:
              state.index == state.items.length - 1 ? state.index : state.index + 1,
          items: state.items,
        ),
      );
}
