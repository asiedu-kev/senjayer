import 'dart:convert';

class Actor {
  final int id;
  final String name;
  final String imageUrl;
  final String phone;
  final String email;
  final bool isOrganizer;
  Actor({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.phone,
    required this.email,
    required this.isOrganizer,
  });

  Actor copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? phone,
    String? email,
    bool? isOrganizer,
  }) {
    return Actor(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isOrganizer: isOrganizer ?? this.isOrganizer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'phone': phone,
      'email': email,
      'isOrganizer': isOrganizer,
    };
  }

  factory Actor.fromMap(Map<String, dynamic> map) {
    return Actor(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      imageUrl: map['image_url'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      isOrganizer: map['role_id'] != null
          ? map['role_id'] == 3
              ? true
              : false
          : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Actor.fromJson(String source) => Actor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Actor(id: $id, name: $name, imageUrl: $imageUrl, phone: $phone, email: $email, isOrganizer: $isOrganizer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Actor &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.phone == phone &&
        other.email == email &&
        other.isOrganizer == isOrganizer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        isOrganizer.hashCode;
  }
}

List<Actor> demoActors = [
  Actor(
    name: "Togbè Yéton",
    isOrganizer: false,
    imageUrl: "assets/images/togbe_profile.png",
    email: "",
    id: 0,
    phone: "",
  ),
  Actor(
    name: "Vano Baby",
    isOrganizer: false,
    imageUrl: "assets/images/vano_profile.png",
    email: "",
    id: 1,
    phone: "",
  ),
  Actor(
    name: "Groupe Empire",
    isOrganizer: true,
    imageUrl: "assets/images/empire.png",
    email: "",
    id: 2,
    phone: "",
  ),
  Actor(
    name: "Beyonce & Jay Z",
    isOrganizer: false,
    imageUrl: "assets/images/amazon.png",
    email: "",
    id: 3,
    phone: "",
  ),
];
