import 'dart:convert';

class Event {
  final String imagePath;
  final String title;
  final String location;
  final int price;
  final DateTime date;
  Event({
    required this.imagePath,
    required this.title,
    required this.location,
    required this.price,
    required this.date,
  });

  Event copyWith({
    String? imagePath,
    String? title,
    String? location,
    int? price,
    DateTime? date,
  }) {
    return Event(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      location: location ?? this.location,
      price: price ?? this.price,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'title': title,
      'location': location,
      'price': price,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      imagePath: map['imagePath'] ?? '',
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      price: map['price']?.toInt() ?? 0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Event(imagePath: $imagePath, title: $title, location: $location, price: $price, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Event &&
        other.imagePath == imagePath &&
        other.title == title &&
        other.location == location &&
        other.price == price &&
        other.date == date;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        title.hashCode ^
        location.hashCode ^
        price.hashCode ^
        date.hashCode;
  }
}

List<Event> demoEvents = [
  Event(
    imagePath: "assets/images/VDA_mini.png",
    title: "Concert VDA",
    location: "Stade GMK",
    price: 2000,
    date: DateTime(2022, 04, 17, 21, 00),
  ),
  Event(
    imagePath: "assets/images/Vano_mini.png",
    title: "Concert Vano",
    location: "Stade GMK",
    price: 2000,
    date: DateTime(2022, 04, 17, 21, 00),
  ),
];
