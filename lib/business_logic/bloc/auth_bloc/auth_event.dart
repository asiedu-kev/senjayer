import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:senjayer/data/models/user.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;
  final User user;

  const LoggedIn({required this.token, required this.user,});

  @override
  String toString() => 'LoggedIn(token: $token, user: $user)';

  LoggedIn copyWith({
    String? token,
    User? user,
  }) {
    return LoggedIn(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'user': user.toMap(),
    };
  }

  factory LoggedIn.fromMap(Map<String, dynamic> map) {
    return LoggedIn(
      token: map['token'] ?? '',
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedIn.fromJson(String source) => LoggedIn.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoggedIn &&
      other.token == token &&
      other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}

class LoggedOut extends AuthenticationEvent {}
