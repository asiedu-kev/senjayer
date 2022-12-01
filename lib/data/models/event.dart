import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:senjayer/data/models/ticket.dart';

class Event {
  final int id;
  final int categoryId;
  final int userId;
  final String description;
  final String imageUrl;
  final String name;
  final String eventAddress;
  final List<Ticket> tickets;
  final DateTime startDate;
  final DateTime endDate;
  Event({
    required this.id,
    required this.categoryId,
    required this.userId,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.eventAddress,
    required this.tickets,
    required this.startDate,
    required this.endDate,
  });

  Event copyWith({
    int? id,
    int? categoryId,
    int? userId,
    String? description,
    String? imageUrl,
    String? name,
    String? eventAddress,
    List<Ticket>? tickets,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Event(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      userId: userId ?? this.userId,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      eventAddress: eventAddress ?? this.eventAddress,
      tickets: tickets ?? this.tickets,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryId,
      'user_id': userId,
      'description': description,
      'image_url': imageUrl,
      'name': name,
      'event_address': eventAddress,
      'tickets': tickets.map((x) => x.toMap()).toList(),
      'start_date': startDate.millisecondsSinceEpoch,
      'end_date': endDate.millisecondsSinceEpoch,
    };
  }

  int getMinTicketPrice() {
    if (tickets.isNotEmpty) {
      int minPrice = tickets[0].price;
      for (var i = 1; i < tickets.length; i++) {
        if (tickets[i].price < minPrice) {
          minPrice = tickets[i].price;
        }
      }
      return minPrice;
    } else {
      return 0;
    }
  }

  factory Event.fromMap(Map<String, dynamic> map) {/* 
    log(map['id'].toString());
    log(map['category_id'].toString());
    log(map['user_id'].toString());
    log(map['description'].toString());
    log(map['image_url'].toString());
    log(map['name'].toString());
    log(map['event_address'].toString());
    log(map['tickets'].toString());
    log(map['start_date'].toString()); */
    return Event(
      id: map['id']?.toInt() ?? 0,
      categoryId: map['category_id']?.toInt() ?? 0,
      userId: map['user_id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      imageUrl: map['image_url'] ?? '',
      name: map['name'] ?? '',
      eventAddress: map['event_address'] ?? '',
      tickets: map['tickets'] != null
          ? List<Ticket>.from(map['tickets']?.map((x) => Ticket.fromMap(x)))
          : [],
      startDate: DateTime.parse(map["start_date"]),
      endDate: DateTime.parse(map["end_date"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Event(id: $id, categoryId: $categoryId, userId: $userId, description: $description, imageUrl: $imageUrl, name: $name, eventAddress: $eventAddress, tickets: $tickets, startDate: $startDate, endDate: $endDate,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Event &&
        other.id == id &&
        other.categoryId == categoryId &&
        other.userId == userId &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.eventAddress == eventAddress &&
        listEquals(other.tickets, tickets) &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryId.hashCode ^
        userId.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        name.hashCode ^
        eventAddress.hashCode ^
        tickets.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}

List<Event> demoEvents = [
  Event(
    imageUrl: "assets/images/VDA_mini.png",
    name: "Concert VDA",
    eventAddress: "Stade GMK",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
  Event(
    imageUrl: "assets/images/Vano_mini.png",
    name: "Concert Vano",
    eventAddress: "Stade GMK",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
];

List<Event> demoFavoriteEvents = [
  Event(
    imageUrl: "assets/images/VDA_large.png",
    name: "Concert VDA",
    eventAddress: "Stade GMK",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
  Event(
    imageUrl: "assets/images/beninoise_large.png",
    name: "Village de l'indépendance",
    eventAddress: "Family Beach, Cotonou BENIN",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 2,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
  Event(
    imageUrl: "assets/images/showcase_large.png",
    name: "Showcase Vano",
    eventAddress: "Stade GMK",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
];

List<Event> demoSpotlightEvents = [
  Event(
    imageUrl: "assets/images/vano_large.png",
    name: "Concert Vano",
    eventAddress: "Stade GMK",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
  Event(
    imageUrl: "assets/images/gourmand_large.png",
    name: "Eat & Drink Cotonou",
    eventAddress: "Family Beach, Cotonou BENIN",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
  Event(
    imageUrl: "assets/images/ze_night_large.png",
    name: "ZeChill, Afro Vibes",
    eventAddress: "Family Beach, Cotonou BENIN",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
];

List<Event> demoEventListEvents = [
  Event(
    imageUrl: "assets/images/vano_side.png",
    name: "Concert Vano",
    eventAddress: "Stade GMK",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
  Event(
    imageUrl: "assets/images/ze_night_side.png",
    name: "ZeChill, Afro Vibes",
    eventAddress: "Family Beach, Cotonou BENIN",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
  Event(
    imageUrl: "assets/images/gourmand_side.png",
    name: "Eat & Drink Cotonou",
    eventAddress: "Family Beach, Cotonou BENIN",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
  Event(
    imageUrl: "assets/images/showcase_side.png",
    name: "Showcase Vano",
    eventAddress: "Family Beach, Cotonou BENIN",
    tickets: demoTickets,
    startDate: DateTime(2022, 04, 17, 21, 00),
    categoryId: 1,
    description: "",
    id: 1,
    userId: 1,
    endDate: DateTime(2022, 04, 17, 23, 00),
  ),
];
