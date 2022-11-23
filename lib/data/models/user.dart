import 'dart:convert';

class User {
  final int id;
  final int roleId;
  final String name;
  final String phone;
  final String email;
  User({
    required this.id,
    required this.roleId,
    required this.name,
    required this.phone,
    required this.email,
  });

  User copyWith({
    int? id,
    int? roleId,
    String? name,
    String? phone,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      roleId: roleId ?? this.roleId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'roleId': roleId,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      roleId: map['roleId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, roleId: $roleId, name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.roleId == roleId &&
      other.name == name &&
      other.phone == phone &&
      other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      roleId.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      email.hashCode;
  }
}
