import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';

class AddPostForumDiskusiResponse {
  final String status;
  final String message;
  final PostForum postForum;

  AddPostForumDiskusiResponse({
    required this.status,
    required this.message,
    required this.postForum,
  });

  factory AddPostForumDiskusiResponse.fromJson(String str) => AddPostForumDiskusiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddPostForumDiskusiResponse.fromMap(Map<String, dynamic> json) => AddPostForumDiskusiResponse(
    status: json["status"],
    message: json["message"],
    postForum: PostForum.fromMap(json["post"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "post": postForum.toJson(),
  };
}

class PostForum {
  final int id;
  final int userId;
  final String content;
  String? gambar;
  final bool liked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  PostForum({
    required this.id,
    required this.userId,
    required this.content,
    this.gambar,
    required this.liked,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory PostForum.fromJson(String str) => PostForum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostForum.fromMap(Map<String, dynamic> json) =>
    PostForum(
    id: json["id"],
    userId: json["user_id"],
    content: json["content"],
    gambar: json["gambar"] ?? "",
    liked: json["liked"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: json["user"] != null
        ? User.fromMap(json["user"] as Map<String, dynamic>)
        : User.fromMap({}),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "content": content,
    "gambar": gambar ?? "",
    "liked": liked,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toMap(),
  };
}