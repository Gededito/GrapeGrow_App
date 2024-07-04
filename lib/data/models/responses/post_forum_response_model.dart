import 'dart:convert';

class PostForumResponse {
  final String status;
  final String message;
  final PostForum postForum;

  PostForumResponse({
    required this.status,
    required this.message,
    required this.postForum,
  });

  factory PostForumResponse.fromJson(String str) => PostForumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostForumResponse.fromMap(Map<String, dynamic> json) => PostForumResponse(
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
  int? id;
  int? userId;
  String? content;
  String? gambar;
  bool? liked;
  DateTime? createdAt;
  DateTime? updatedAt;

  PostForum({
    this.id,
    this.userId,
    this.content,
    this.gambar,
    this.liked,
    this.createdAt,
    this.updatedAt,
  });

  factory PostForum.fromJson(String str) => PostForum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostForum.fromMap(Map<String, dynamic> json) => PostForum(
    id: json["id"],
    userId: json["user_id"],
    content: json["content"] ?? "-",
    gambar: json["gambar"] ?? "-",
    liked: json["liked"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "content": content,
    "gambar": gambar ?? "_",
    "liked": liked,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}