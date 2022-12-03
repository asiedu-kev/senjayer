import 'dart:convert';

class User {
  final int id;
  final int roleId;
  final String name;
  final String? imageUrl;
  final String phone;
  final String email;
  final String? gender;
  User({
    required this.id,
    required this.roleId,
    required this.name,
    this.imageUrl,
    required this.phone,
    required this.email,
    this.gender,
  });

  User copyWith({
    int? id,
    int? roleId,
    String? imageUrl,
    String? name,
    String? phone,
    String? email,
    String? gender,
  }) {
    return User(
      id: id ?? this.id,
      roleId: roleId ?? this.roleId,
      name: name ?? this.name,
      imageUrl: imageUrl?? this.imageUrl,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gender: gender?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role_id': roleId,
      'name': name,
      'image_url': imageUrl,
      'phone': phone,
      'email': email,
      'gender': gender,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      roleId: map['roleId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender']?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, roleId: $roleId, name: $name, imageUrl: $imageUrl, phone: $phone, email: $email, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.roleId == roleId &&
      other.name == name &&
      other.imageUrl == imageUrl &&
      other.phone == phone &&
      other.email == email &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      roleId.hashCode ^
      name.hashCode ^
      imageUrl.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      gender.hashCode;
  }
}
