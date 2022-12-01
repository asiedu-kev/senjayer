part of 'payment_method_cubit.dart';

class PaymentMethodState {
  final int selectedMethodIndex;
  final List<PaymentMethod> methods;
  PaymentMethodState({
    required this.selectedMethodIndex,
    required this.methods,
  });
}
