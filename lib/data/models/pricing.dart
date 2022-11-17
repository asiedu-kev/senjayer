class Pricing {
  final String label;
  final int price;
  Pricing({
    required this.label,
    required this.price,
  });
}

List<Pricing> demoPricing = [
  Pricing(
    label: "Platinium",
    price: 50000,
  ),
  Pricing(
    label: "Gold",
    price: 10000,
  ),
  Pricing(
    label: "Silver",
    price: 5000,
  ),
];
