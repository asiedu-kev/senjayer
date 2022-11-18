import 'dart:convert';

class Pricing {
  final String label;
  final int price;
  Pricing({
    required this.label,
    required this.price,
  });

  Pricing copyWith({
    String? label,
    int? price,
  }) {
    return Pricing(
      label: label ?? this.label,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'price': price,
    };
  }

  factory Pricing.fromMap(Map<String, dynamic> map) {
    return Pricing(
      label: map['label'] ?? '',
      price: map['price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pricing.fromJson(String source) =>
      Pricing.fromMap(json.decode(source));

  @override
  String toString() => 'Pricing(label: $label, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pricing && other.label == label && other.price == price;
  }

  @override
  int get hashCode => label.hashCode ^ price.hashCode;
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
