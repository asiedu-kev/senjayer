import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/data/models/ticket.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit()
      : super(
          TicketState(
            itemCount: 1,
            ticket: demoTickets[0],
          ),
        );

  void reset() {
    emit(
      TicketState(
        ticket: demoTickets[0],
        itemCount: 1,
      ),
    );
  }

  void setticket(Ticket ticket) {
    emit(
      TicketState(
        ticket: ticket,
        itemCount: 1,
      ),
    );
  }

  void incrementTickets() {
    emit(
      TicketState(ticket: state.ticket, itemCount: state.itemCount + 1),
    );
  }

  void decrementTickets() {
    emit(
      TicketState(ticket: state.ticket, itemCount: state.itemCount > 1 ? state.itemCount - 1 : 1),
    );
  }

  int getTotalAmount(){
    return state.itemCount * state.ticket.price;
  }
}
