import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/forum/add_comment_forum_response.dart';

class GetCommentByIdForumResponse {
  List<CommentForum> comments;

  GetCommentByIdForumResponse({required this.comments});

  factory GetCommentByIdForumResponse.fromJson(String str) =>
      GetCommentByIdForumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCommentByIdForumResponse.fromMap(Map<String, dynamic> json) {
    if (!json.containsKey("commments") || json["commments"] == null) {
      throw const FormatException("Invalid JSON: Missing or null 'comments' field");
    }

    List<CommentForum> parsedComments = [];
    for (var commentJson in json["commments"]) {
      try {
        parsedComments.add(CommentForum.fromMap(commentJson));
      } catch (e) {
        print("Error parsing comment: $e"); // Log parsing errors
      }
    }

    return GetCommentByIdForumResponse(comments: parsedComments);
  }

  Map<String, dynamic> toMap() => {
    "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
  };
}