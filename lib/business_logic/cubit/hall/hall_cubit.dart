import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/hall.dart';
import 'package:senjayer/data/repositories/hall_repository.dart';

part 'hall_state.dart';

class HallCubit extends Cubit<HallState> {
  HallCubit() : super(HallIsFetching());

  void getHalls() async {
    final HallRepository hallRepository = HallRepository();
    emit(HallIsFetching());
    final getHallsEither = await hallRepository.getHalls();
    getHallsEither.fold(
      (_) => emit(HallFetchingFailed()),
      (halls) => halls.isEmpty
          ? emit(HallIsEmpty())
          : emit(
              HallFetched(halls: halls),
            ),
    );
  }
}
