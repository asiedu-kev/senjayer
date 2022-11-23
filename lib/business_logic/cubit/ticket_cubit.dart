import 'package:bloc/bloc.dart';
import 'package:senjayer/data/models/pricing.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit()
      : super(
          TicketState(
            itemCount: 1,
            pricing: demoPricing[0],
          ),
        );

  void reset() {
    emit(
      TicketState(
        pricing: demoPricing[0],
        itemCount: 1,
      ),
    );
  }

  void setPricing(Pricing pricing) {
    emit(
      TicketState(
        pricing: pricing,
        itemCount: 1,
      ),
    );
  }

  void incrementTickets() {
    emit(
      TicketState(pricing: state.pricing, itemCount: state.itemCount + 1),
    );
  }

  void decrementTickets() {
    emit(
      TicketState(pricing: state.pricing, itemCount: state.itemCount > 1 ? state.itemCount - 1 : 1),
    );
  }

  int getTotalAmount(){
    return state.itemCount * state.pricing.price;
  }
}
