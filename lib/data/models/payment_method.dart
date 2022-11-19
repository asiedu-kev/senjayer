class PaymentMethod {
  final String label;
  final String imagePath;
  PaymentMethod({
    required this.label,
    required this.imagePath,
  });
}
final List<PaymentMethod> demoMethods = [
PaymentMethod(label: "Carte Bancaire", imagePath: "assets/icons/credit_card.png"),
PaymentMethod(label: "Moov Money", imagePath: "assets/icons/moov_money.png"),
PaymentMethod(label: "MTN Mobile Money", imagePath: "assets/icons/mtn_mobile_money.png"),
PaymentMethod(label: "Wave", imagePath: "assets/icons/wave.png"),
PaymentMethod(label: "Paypal", imagePath: "assets/icons/Paypal.png"),
];