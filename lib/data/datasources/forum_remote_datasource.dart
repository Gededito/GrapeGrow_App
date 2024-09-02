import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/request/comment_request_model.dart';
import 'package:grapegrow_apps/data/models/request/post_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/forum/add_comment_forum_response.dart';
import 'package:grapegrow_apps/data/models/responses/forum/add_post_forum_response_model.dart';
import 'package:grapegrow_apps/data/models/responses/forum/get_all_post_forum_response_model.dart';
import 'package:grapegrow_apps/data/models/responses/forum/get_comment_id_forum_response_model.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:http/http.dart' as http;

class ForumRemoteDatasource {
  
  // Create Post Forum
  Future<Either<String, AddPostForumDiskusiResponse>> createPost(
    PostRequestModel postRequest,
  ) async {

    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final uri = Uri.parse("${Variables.baseUrl}/api/post/store");

      final Map<String, String> headers = {
        'Authorization': 'Bearer ${authData!.accessToken}',
      };

      http.Response response;

      if (postRequest.gambar == null) {
        headers['Content-Type'] = 'application/json; charset=UTF-8';
        response = await http.post(
          uri,
          headers: headers,
          body: jsonEncode({'content': postRequest.content}),
        );
      } else {
        var request = http.MultipartRequest('POST', uri);
        request.headers.addAll(headers);
        request.files.add(await http.MultipartFile.fromPath(
          'gambar',
          postRequest.gambar!.path
        ));
        request.fields['content'] = postRequest.content;
        response = await http.Response.fromStream(await request.send());
      }

      final statusCode = response.statusCode;
      final responseData = response.body;

      if (statusCode == 201) {
        return Right(AddPostForumDiskusiResponse.fromMap(jsonDecode(responseData)));
      } else {
        return const Left('Failed Create Post Forum');
      }

    } on SocketException {
      return const Left("No Internet Connection");
    } catch (e) {
      // print(e.toString());
      return Left("An error occurred: ${e.toString()}");
    }
  }

  // Get All Post Forum
  Future<Either<String, GetAllPostForumResponse>> getAllPost() async {

    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final response = await http.get(
        Uri.parse("${Variables.baseUrl}/api/posts"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authData!.accessToken}',
        }
      );

      if (response.statusCode == 200) {
        return Right(GetAllPostForumResponse.fromMap(jsonDecode(response.body)));
      } else {
        return const Left("Failed Get All Post");
      }

    } on SocketException {
      return const Left("No Internet Connection");
    } catch (e) {
      return Left("An error occurred: ${e.toString()}");
    }
  }

  // Create Comment Forum
  Future<Either<String, AddCommentByIdForumResponse>> createCommentByIdForum(
      CommentRequestModel commentRequest,
      int id,
  ) async {

    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final uri = Uri.parse("${Variables.baseUrl}/api/post/comment/$id");
      var request = http.MultipartRequest('POST', uri);

      final fileName = commentRequest.gambar;

      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData!.accessToken}',
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
      }

      request.fields.addAll(fields);
      request.headers.addAll(headers);

      final http.StreamedResponse streamedResponse = await request.send();
      final int statusCode = streamedResponse.statusCode;

      final Uint8List responseList = await streamedResponse.stream.toBytes();
      final String responseData = String.fromCharCodes(responseList);

      if (statusCode == 201) {
        return Right(AddCommentByIdForumResponse.fromMap(jsonDecode(responseData)));
      } else {
        return const Left("Failed Create Comment Forum");
      }

    } on SocketException {
      return const Left("No Internet Connection");
    } catch (e) {
      // print(e.toString());
      return Left("An error occurred: ${e.toString()}");
    }
  }

  // Get Comment Forum By Id
  Future<Either<String, GetCommentByIdForumResponse>> getCommentByIdForum(
      int id
  ) async {

    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final response = await http.get(
          Uri.parse("${Variables.baseUrl}/api/post/comments/${id.toString()}"),
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${authData!.accessToken}',
          }
      );

      if (response.statusCode == 200) {
        return Right(GetCommentByIdForumResponse.fromMap(jsonDecode(response.body)));
      } else {
        return const Left("Gagal Memunculkan Comment");
      }

    } on SocketException {
      return const Left("No Internet Connection");
    } catch (e) {
      return Left("An error occurred: ${e.toString()}");
    }
  }

  // Like And Dislike
  Future<Either<String, dynamic>> likeAndDislike(
      int id
  ) async {

    try {
      final authData = await AuthLocalDatasource().getAuthData();
      
      final response = await http.post(
        Uri.parse("${Variables.baseUrl}/api/post/like/$id"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authData!.accessToken}',
        }
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody['liked'] == true) {
          return Right(responseBody['message']);
        } else {
          return Left(responseBody['message'] ?? "Failed to like/dislike postingan");
        }
      } else {
        return Left("Failed to like/dislike postingan. Status code: ${response.statusCode}");
      }
    } on SocketException {
      return const Left("No Internet Connection");
    } catch (e) {
      return Left("An error occurred: ${e.toString()}");
    }
  }
}