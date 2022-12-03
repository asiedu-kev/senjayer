import 'dart:convert';

class SocialLink {
  final String link;
  final String icon;
  SocialLink({
    required this.link,
    required this.icon,
  });

  SocialLink copyWith({
    String? link,
    String? icon,
  }) {
    return SocialLink(
      link: link ?? this.link,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'icon': icon,
    };
  }

  factory SocialLink.fromMap(Map<String, dynamic> map) {
    return SocialLink(
      link: map['link'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialLink.fromJson(String source) => SocialLink.fromMap(json.decode(source));

  @override
  String toString() => 'SocialLink(link: $link, icon: $icon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SocialLink &&
      other.link == link &&
      other.icon == icon;
  }

  @override
  int get hashCode => link.hashCode ^ icon.hashCode;
}
