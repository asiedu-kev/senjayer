import 'dart:convert';

class Comment {
  final int userId;
  final int postId;
  final String content;
  Comment({
    required this.userId,
    required this.postId,
    required this.content,
  });

  Comment copyWith({
    int? userId,
    int? postId,
    String? content,
  }) {
    return Comment(
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'post_id': postId,
      'content': content,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      userId: map['user_id']?.toInt() ?? 0,
      postId: map['post_id']?.toInt() ?? 0,
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));

  @override
  String toString() => 'Comment(userId: $userId, postId: $postId, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Comment &&
      other.userId == userId &&
      other.postId == postId &&
      other.content == content;
  }

  @override
  int get hashCode => userId.hashCode ^ postId.hashCode ^ content.hashCode;
}
