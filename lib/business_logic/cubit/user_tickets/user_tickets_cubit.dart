import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/data/models/ticket.dart';
import 'package:senjayer/data/repositories/user_repository.dart';

part 'user_tickets_state.dart';

class UserTicketsCubit extends Cubit<UserTicketsState> {
  UserTicketsCubit() : super(UserTicketsIsFetching());

  void getUserTickets() async {
    final UserRepository userRepository = UserRepository();
    emit(UserTicketsIsFetching());
    final getUserTickets = await userRepository.getUserTickets();
    getUserTickets.fold((_) {
      emit(UserTicketsFetchingFailed());
    }, (userTickets) {
      emit(UserTicketsFetched(userTickets: userTickets));
    });
  }
}
