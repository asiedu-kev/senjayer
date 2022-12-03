import 'dart:convert';

class Ticket {
  final int id;
  final String name;
  final String descrption;
  final String qrUrl;
  final int quantity;
  final int price;
  final int eventId;
  Ticket({
    required this.id,
    required this.name,
    required this.descrption,
    required this.qrUrl,
    required this.quantity,
    required this.price,
    required this.eventId,
  });


  Ticket copyWith({
    int? id,
    String? name,
    String? descrption,
    String? qrUrl,
    int? quantity,
    int? price,
    int? eventId,
  }) {
    return Ticket(
      id: id ?? this.id,
      name: name ?? this.name,
      descrption: descrption ?? this.descrption,
      qrUrl: qrUrl?? this.qrUrl,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      eventId: eventId ?? this.eventId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'descrption': descrption,
      'qr_url': qrUrl,
      'quantity': quantity,
      'price': price,
      'eventId': eventId,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      descrption: map['descrption'] ?? '',
      qrUrl: map['qr_url'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      eventId: map['event_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ticket.fromJson(String source) => Ticket.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ticket(id: $id, name: $name, descrption: $descrption, quantity: $quantity, price: $price, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Ticket &&
      other.id == id &&
      other.name == name &&
      other.descrption == descrption &&
      other.quantity == quantity &&
      other.price == price &&
      other.eventId == eventId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      descrption.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      eventId.hashCode;
  }
}

List<Ticket> demoTickets = [
  Ticket(
    name: "Platinium",
    price: 50000,
    descrption: "",
    eventId: 1,
    id: 1,
    quantity: 100,
    qrUrl: '',
  ),
  Ticket(
    name: "Gold",
    price: 10000,
    descrption: "",
    eventId: 1,
    id: 3,
    quantity: 100,
    qrUrl: '',
  ),
  Ticket(
    name: "Silver",
    price: 5000,
    descrption: "",
    eventId: 1,
    id: 2,
    quantity: 100,
    qrUrl: '',
  ),
];
