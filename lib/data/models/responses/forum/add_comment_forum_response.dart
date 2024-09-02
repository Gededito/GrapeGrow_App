import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';

class AddCommentByIdForumResponse {
  final String status;
  final String message;
  final CommentForum comment;

  AddCommentByIdForumResponse({
    required this.status,
    required this.message,
    required this.comment,
  });

  factory AddCommentByIdForumResponse.fromJson(String str) => AddCommentByIdForumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddCommentByIdForumResponse.fromMap(Map<String, dynamic> json) => AddCommentByIdForumResponse(
    status: json["status"],
    message: json["message"],
    comment: CommentForum.fromMap(json["comment"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "comment": comment.toMap(),
  };
}

class CommentForum {
  final int id;
  final int postId;
  final int userId;
  final String body;
  final String gambar;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  CommentForum({
    required this.id,
    required this.postId,
    required this.userId,
    required this.body,
    required this.gambar,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory CommentForum.fromJson(String str) => CommentForum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentForum.fromMap(Map<String, dynamic> json) => CommentForum(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"] is int ? json["post_id"] : int.parse(json["post_id"]),
    body: json["body"],
    gambar: json["gambar"] ?? "",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: json["user"] != null
        ? User.fromMap(json["user"] as Map<String, dynamic>)
        : User.fromMap({}),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "body": body,
    "gambar": gambar,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toMap(),
  };
}