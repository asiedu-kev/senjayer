import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:senjayer/business_logic/bloc/onboarding_bloc/onboarding_event.dart';
import 'package:senjayer/business_logic/bloc/onboarding_bloc/onboarding_state.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final LocalDataRepository localDataRepository;
  OnboardingBloc({
    required this.localDataRepository,
  }) : super(OnboardingUnitialized()) {
    on<AppStarted>((event, emit) async {
      final bool hasAlreadySeenOnboarding =
          await localDataRepository.getHasSeenOnboarding();
      if (hasAlreadySeenOnboarding) {
        emit(HasAlreadySeenOnboarding());
      } else {
        emit(HasNeverSeenOnboarding());
      }
    });

    on<SeenOnboarding>(
      (event, emit) async {
          await localDataRepository.setHasSeenOnboarding(true);},
    );
  }
}
