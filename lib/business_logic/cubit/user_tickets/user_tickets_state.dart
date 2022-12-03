part of 'user_tickets_cubit.dart';

@immutable
abstract class UserTicketsState {}

class UserTicketsIsFetching extends UserTicketsState {}

class UserTicketsFetched extends UserTicketsState {
  final List<Ticket> userTickets;
  UserTicketsFetched({
    required this.userTickets,
  });
}

class UserTicketsFetchingFailed extends UserTicketsState {}
