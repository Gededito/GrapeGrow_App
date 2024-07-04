import 'dart:io';

class PostRequestModel {
  final String content;
  File? gambar;

  PostRequestModel({
    required this.content,
    this.gambar,
  });
}