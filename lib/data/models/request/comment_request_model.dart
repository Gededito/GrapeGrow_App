import 'dart:io';

class CommentRequestModel {
  final String body;
  File? gambar;

  CommentRequestModel({
    required this.body,
    this.gambar,
  });
}