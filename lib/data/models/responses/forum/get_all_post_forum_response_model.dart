import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/forum/add_post_forum_response_model.dart';

class GetAllPostForumResponse {
  final String status;
  List<PostForum> posts;

  GetAllPostForumResponse({
    required this.status,
    required this.posts
  });

  factory GetAllPostForumResponse.fromJson(String str) =>
      GetAllPostForumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllPostForumResponse.fromMap(Map<String, dynamic> json) => GetAllPostForumResponse(
    status: json["status"],
    posts: List<PostForum>.from(json["posts"].map((x) => PostForum.fromMap(x)))
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "posts": List<PostForum>.from(posts.map((x) => x.toMap())),
  };
}