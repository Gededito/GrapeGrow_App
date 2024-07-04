import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';
import 'package:grapegrow_apps/data/models/responses/post_forum_response_model.dart';

class GetCommentForumResponse {
  final List<Comment> comments;

  GetCommentForumResponse({
    required this.comments
  });

  factory GetCommentForumResponse.fromJson(String str) =>
      GetCommentForumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCommentForumResponse.fromMap(Map<String, dynamic> json) => GetCommentForumResponse(
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "comments": List<Comment>.from(comments.map((x) => x.toMap()))
  };
}

class Comment {
  final int id;
  final int userId;
  final int postId;
  final String body;
  String? gambar;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PostForum postForum;
  final User user;

  Comment({
    required this.id,
    required this.userId,
    required this.postId,
    required this.body,
    this.gambar,
    required this.createdAt,
    required this.updatedAt,
    required this.postForum,
    required this.user,
  });

  factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    body: json["body"] ?? "",
    gambar: json["gambar"] ?? "",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    postForum: PostForum.fromMap(json["post"]),
    user: User.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "body": body,
    "gambar": gambar,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "post": postForum.toMap(),
    "user": user.toMap(),
  };
}