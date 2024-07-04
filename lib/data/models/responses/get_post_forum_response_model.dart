import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';

class GetAllPostForumResponse {
  final String status;
  final List<Post> posts;

  GetAllPostForumResponse({
    required this.status,
    required this.posts
  });

  factory GetAllPostForumResponse.fromJson(String str) =>
      GetAllPostForumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllPostForumResponse.fromMap(Map<String, dynamic> json) => GetAllPostForumResponse(
    status: json["status"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromMap(x)))
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "posts": List<Post>.from(posts.map((x) => x.toMap())),
  };
}

class Post {
  final int id;
  final int userId;
  final String content;
  String? gambar;
  bool? liked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    this.gambar,
    this.liked,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json["id"],
    userId: json["user_id"],
    content: json["content"] ?? "",
    gambar: json["gambar"] ?? "",
    liked: json["liked"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "content": content,
    "gambar": gambar,
    "liked": liked,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "user": user.toMap(),
  };
}