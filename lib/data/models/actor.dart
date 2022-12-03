import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:senjayer/data/models/social_link.dart';

class Actor {
  final int id;
  final String fullName;
  final String picture;
  final int categoryId;
  final String entitled;
  final String phone;
  final String email;
  final String type;
  final String about;
  final Map<String, SocialLink> socialLinks;
  Actor({
    required this.id,
    required this.fullName,
    required this.picture,
    required this.categoryId,
    required this.entitled,
    required this.phone,
    required this.email,
    required this.type,
    required this.about,
    required this.socialLinks,
  });

  Actor copyWith({
    int? id,
    String? fullName,
    String? picture,
    int? categoryId,
    String? entitled,
    String? phone,
    String? email,
    String? type,
    String? about,
    Map<String, SocialLink>? socialLinks,
  }) {
    return Actor(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      picture: picture ?? this.picture,
      categoryId: categoryId ?? this.categoryId,
      entitled: entitled ?? this.entitled,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      type: type ?? this.type,
      about: about ?? this.about,
      socialLinks: socialLinks ?? this.socialLinks,
    );
  }

  factory Actor.fromMap(Map<String, dynamic> map) {
    return Actor(
      id: map['id']?.toInt() ?? 0,
      fullName: map['full_name'] ?? '',
      picture: map['picture'] ?? '',
      categoryId: map['category_id']?.toInt() ?? 0,
      entitled: map['entitled'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      type: map['type'] ?? '',
      about: map['about'] ?? '',
      socialLinks: map['social_links'] != null
          ? (map['social_link'] as Map)
              .map((key, value) => MapEntry(key, SocialLink.fromMap(value)))
          : {},
    );
  }

  factory Actor.fromJson(String source) => Actor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Actor(id: $id, fullName: $fullName, picture: $picture, categoryId: $categoryId, entitled: $entitled, phone: $phone, email: $email, type: $type, about: $about, socialLinks: $socialLinks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Actor &&
        other.id == id &&
        other.fullName == fullName &&
        other.picture == picture &&
        other.categoryId == categoryId &&
        other.entitled == entitled &&
        other.phone == phone &&
        other.email == email &&
        other.type == type &&
        other.about == about &&
        mapEquals(other.socialLinks, socialLinks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        picture.hashCode ^
        categoryId.hashCode ^
        entitled.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        type.hashCode ^
        about.hashCode ^
        socialLinks.hashCode;
  }
}

List<Actor> demoActors = [
  Actor(
    fullName: "Togbè Yéton",
    type: 'false',
    picture: "assets/images/togbe_profile.png",
    email: "",
    id: 0,
    phone: "",
    about: "",
    categoryId: 1,
    entitled: "",
    socialLinks: {'facevook': SocialLink(link: "link", icon: "con")},
  ),
  Actor(
    fullName: "Vano Baby",
    type: 'false',
    picture: "assets/images/vano_profile.png",
    email: "",
    id: 1,
    phone: "",
    about: "",
    categoryId: 1,
    entitled: "",
    socialLinks: {'facevook': SocialLink(link: "link", icon: "con")},
  ),
  Actor(
    fullName: "Groupe Empire",
    type: 'true',
    picture: "assets/images/empire.png",
    email: "",
    id: 2,
    phone: "",
    about: "",
    categoryId: 1,
    entitled: "",
    socialLinks: {'facevook': SocialLink(link: "link", icon: "con")},
  ),
  Actor(
    fullName: "Beyonce & Jay Z",
    type: 'false',
    picture: "assets/images/amazon.png",
    email: "",
    id: 3,
    phone: "",
    about: "",
    categoryId: 1,
    entitled: "",
    socialLinks: {'facevook': SocialLink(link: "link", icon: "con")},
  ),
];
