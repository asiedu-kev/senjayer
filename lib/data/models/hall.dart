import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:senjayer/data/models/social_link.dart';

class Hall {
  final int id;
  final String title;
  final String description;
  final List<String> picture;
  final int categoryId;
  final List<SocialLink> socialLinks;
  final int nbOfPlace;
  final String city;
  final String country;
  Hall({
    required this.id,
    required this.title,
    required this.description,
    required this.picture,
    required this.categoryId,
    required this.socialLinks,
    required this.nbOfPlace,
    required this.city,
    required this.country,
  });

  Hall copyWith({
    int? id,
    String? title,
    String? description,
    List<String>? picture,
    int? categoryId,
    List<SocialLink>? socialLinks,
    int? nbOfPlace,
    String? city,
    String? country,
  }) {
    return Hall(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      picture: picture ?? this.picture,
      categoryId: categoryId ?? this.categoryId,
      socialLinks: socialLinks ?? this.socialLinks,
      nbOfPlace: nbOfPlace ?? this.nbOfPlace,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'picture': picture,
      'category_id': categoryId,
      'social_link': socialLinks.map((x) => x.toMap()).toList(),
      'nb_place': nbOfPlace,
      'city': city,
      'country': country,
    };
  }

  factory Hall.fromMap(Map<String, dynamic> map) {
    return Hall(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      picture: List<String>.from(map['picture']),
      categoryId: map['category_id']?.toInt() ?? 0,
      socialLinks: List<SocialLink>.from(map['social_link']?.map((x) => SocialLink.fromMap(x))),
      nbOfPlace: map['nb_place']?.toInt() ?? 0,
      city: map['city'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Hall.fromJson(String source) => Hall.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hall(id: $id, title: $title, description: $description, picture: $picture, categoryId: $categoryId, socialLinks: $socialLinks, nbOfPlace: $nbOfPlace, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Hall &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      listEquals(other.picture, picture) &&
      other.categoryId == categoryId &&
      listEquals(other.socialLinks, socialLinks) &&
      other.nbOfPlace == nbOfPlace &&
      other.city == city &&
      other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      picture.hashCode ^
      categoryId.hashCode ^
      socialLinks.hashCode ^
      nbOfPlace.hashCode ^
      city.hashCode ^
      country.hashCode;
  }
}
