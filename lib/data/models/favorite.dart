import 'dart:convert';

class Favorite {
  final int id;
  final int eventId;
  final int userId;
  Favorite({
    required this.id,
    required this.eventId,
    required this.userId,
  });

  Favorite copyWith({
    int? id,
    int? eventId,
    int? userId,
  }) {
    return Favorite(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventId': eventId,
      'userId': userId,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id']?.toInt() ?? 0,
      eventId: map['event_id']?.toInt() ?? 0,
      userId: map['user_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) => Favorite.fromMap(json.decode(source));

  @override
  String toString() => 'Favorite(id: $id, eventId: $eventId, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Favorite &&
      other.id == id &&
      other.eventId == eventId &&
      other.userId == userId;
  }

  @override
  int get hashCode => id.hashCode ^ eventId.hashCode ^ userId.hashCode;
}
