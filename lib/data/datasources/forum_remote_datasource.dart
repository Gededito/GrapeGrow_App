import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/request/comment_request_model.dart';
import 'package:grapegrow_apps/data/models/request/post_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/comment_forum_response.dart';
import 'package:grapegrow_apps/data/models/responses/comment_id_forum_response_model.dart';
import 'package:grapegrow_apps/data/models/responses/get_post_forum_response_model.dart';
import 'package:grapegrow_apps/data/models/responses/post_forum_response_model.dart';
import 'package:http/http.dart' as http;

class ForumRemoteDatasource {
  
  // Create Post Forum
  Future<Either<String, PostForumResponse>> createPost(
    PostRequestModel postRequest,
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final uri = Uri.parse("http://192.168.0.171:8000/api/post/store");
    var request = http.MultipartRequest('POST', uri);

    final fileName = postRequest.gambar;

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authData.accessToken}',
    };

    final Map<String, String> fields = {
      "content": postRequest.content,
    };

    if (fileName != null) {
      final multiPartFile = await http.MultipartFile.fromPath(
        'gambar',
        fileName.path,
      );
      request.files.add(multiPartFile);
    } else {
      print('No Image Selected');
    }

    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      return Right(PostForumResponse.fromMap(jsonDecode(responseData)));
    } else {
      return const Left('Failed Create Post Forum');
    }
  }

  // Get All Post Forum
  Future<Either<String, GetAllPostForumResponse>> getAllPost() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse("http://192.168.0.171:8000/api/posts"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(GetAllPostForumResponse.fromMap(jsonDecode(response.body)));
    } else {
      return const Left('Gagal Memunculkan Data Post');
    }
  }

  // Create Comment Forum
  Future<Either<String, CommentForumResponse>> createCommentByIdForum(
      CommentRequestModel commentRequest,
      String id,
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final uri = Uri.parse("http://192.168.0.171:8000/api/post/comment/$id");
    var request = http.MultipartRequest('POST', uri);

    final fileName = commentRequest.gambar;

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authData.accessToken}',
    };

    final Map<String, String> fields = {
      "body": commentRequest.body,
    };

    if (fileName != null) {
      final multiPartFile = await http.MultipartFile.fromPath(
        'gambar',
        fileName.path
      );
      request.files.add(multiPartFile);
    } else {
      print('No Image Selected');
    }

    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      return Right(CommentForumResponse.fromMap(jsonDecode(responseData)));
    } else {
      return const Left("Failed Create Comment Forum");
    }
  }

  // Get Comment Forum By Id
  Future<Either<String, GetCommentForumResponse>> getCommentByIdForum(
      String id
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse("http://192.168.0.171:8000/api/post/comments/$id"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      return Right(GetCommentForumResponse.fromJson(response.body));
    } else {
      return const Left("Gagal Memunculkan Comment");
    }
  }
}