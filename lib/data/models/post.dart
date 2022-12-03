import 'dart:convert';

class Post {
  final String id;
  final String title;
  final String content;
  final String userId;
  final String categoryId;
  final String imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    required this.categoryId,
    required this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  Post copyWith({
    String? id,
    String? title,
    String? content,
    String? userId,
    String? categoryId,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      imageUrl: imageUrl?? this.imageUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      userId: map['user_id'] ?? '',
      categoryId: map['category_id'] ?? '',
      imageUrl: map['image_url']?? '',
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, title: $title, content: $content, userId: $userId, categoryId: $categoryId, imageUrl : $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Post &&
      other.id == id &&
      other.title == title &&
      other.content == content &&
      other.userId == userId &&
      other.categoryId == categoryId &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      content.hashCode ^
      userId.hashCode ^
      categoryId.hashCode ^
      imageUrl.hashCode;
  }
}
