import 'package:bloc/bloc.dart';
import 'package:senjayer/data/models/payment_method.dart';

part 'payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit()
      : super(
          PaymentMethodState(
            selectedMethodIndex: 0,
            methods: demoMethods,
          ),
        );

  void choosePaymentMethod(int index) {
    emit(
      PaymentMethodState(selectedMethodIndex: index, methods: state.methods),
    );
  }
}
