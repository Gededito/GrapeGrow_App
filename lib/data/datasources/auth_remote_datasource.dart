import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/request/login_request_model.dart';
import 'package:grapegrow_apps/data/models/request/register_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {

  // Register
  Future<Either<String, AuthResponseModel>> register(
    RegisterRequestModel registerRequestModel
  ) async {

    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/register');
      var request = http.MultipartRequest('POST', uri);

      final photoProfil = registerRequestModel.gambar;

      final multiPartFile = await http.MultipartFile.fromPath(
          "profile_photo",
          photoProfil.path
      );
      request.files.add(multiPartFile);

      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final Map<String, String> fields = {
        "name": registerRequestModel.name,
        "email": registerRequestModel.email,
        "phone": registerRequestModel.phone,
        "password": registerRequestModel.password,
      };

      request.fields.addAll(fields);
      request.headers.addAll(headers);

      final http.StreamedResponse streamedResponse = await request.send();
      final int statusCode = streamedResponse.statusCode;

      final Uint8List responseList = await streamedResponse.stream.toBytes();
      final String responseData = String.fromCharCodes(responseList);

      if (statusCode == 200) {
        return Right(AuthResponseModel.fromMap(jsonDecode(responseData)));
      } else {
        final Map<String, dynamic> errorData = jsonDecode(responseData);
        final String errorMessage = errorData['message'] ?? 'Register Gagal';
        return Left(errorMessage);
      }

    } catch (e) {
      return Left("Terjadi Kesalahan Saat Melakukan Pendaftaran: $e");
    }
  }

  // Login
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel loginRequest
  ) async {

    try {
      final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: loginRequest.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(AuthResponseModel.fromJson(response.body));
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        final String errorMessage = errorData['message'] ?? 'Login Gagal';
        return Left(errorMessage);
      }

    } catch (e) {
      return Left("Terjadi Kesalahan Saat Login: $e");
    }
  }

  // Logout
  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData?.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      AuthLocalDatasource().removeAuthData();
      return const Right('Logout Berhasil');
    } else {
      return const Left('Logout Gagal');
    }
  }
}