import 'dart:convert';

class CommentForumResponse {
  final String status;
  final String message;
  final AddComment comment;

  CommentForumResponse({
    required this.status,
    required this.message,
    required this.comment,
  });

  factory CommentForumResponse.fromJson(String str) => CommentForumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentForumResponse.fromMap(Map<String, dynamic> json) => CommentForumResponse(
    status: json["status"],
    message: json["message"],
    comment: AddComment.fromJson(json["comment"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "comment": comment.toJson(),
  };
}

class AddComment {
  int? id;
  int? postId;
  int? userId;
  String? body;
  String? gambar;
  DateTime? createdAt;
  DateTime? updatedAt;

  AddComment({
    this.id,
    this.postId,
    this.userId,
    this.body,
    this.gambar,
    this.createdAt,
    this.updatedAt,
  });

  factory AddComment.fromJson(String str) => AddComment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddComment.fromMap(Map<String, dynamic> json) => AddComment(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    body: json["body"],
    gambar: json["gambar"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "body": body,
    "gambar": gambar,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}