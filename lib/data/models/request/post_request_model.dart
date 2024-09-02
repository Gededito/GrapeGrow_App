import 'dart:convert';
import 'dart:io';

class PostRequestModel {
  final String content;
  File? gambar;

  PostRequestModel({
    required this.content,
    this.gambar,
  });

  factory PostRequestModel.fromJson(String str) =>
      PostRequestModel.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostRequestModel.fromMap(Map<String, dynamic> json) =>
      PostRequestModel(
        content: json["content"],
        gambar: json["gambar"] ?? "",
      );

  Map<String, dynamic> toMap() => {
    "content": content,
    "gambar": gambar ?? "",
  };
}