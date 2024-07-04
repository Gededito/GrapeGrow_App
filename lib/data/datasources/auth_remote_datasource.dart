import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/request/login_request_model.dart';
import 'package:grapegrow_apps/data/models/request/register_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {

  // Register
  Future<Either<String, AuthResponseModel>> register(
    RegisterRequestModel registerRequestModel
  ) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.171:8000/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Register Gagal');
    }
  }

  // Future<Either<String, AuthResponseModel>> register(
  //   RegisterRequestModel registerRequest
  // ) async {
  //   final uri = Uri.parse('${Variables.baseUrl}/api/register');
  //   var request = http.MultipartRequest('POST', uri);

  //   final multiPartFile = http.MultipartFile.fromBytes(
  //     "profile_photo",
  //     registerRequest.bytes,
  //     filename: registerRequest.profilePhoto,
  //   );

  //   final Map<String, String> fields = {
  //     "name": registerRequest.name,
  //     "email": registerRequest.email,
  //     "phone": registerRequest.phone,
  //     "password": registerRequest.password,
  //   };

  //   final Map<String, String> headers = {
  //     "Content-type": "multipart/form-data"
  //   };

  //   request.files.add(multiPartFile);
  //   request.fields.addAll(fields);
  //   request.headers.addAll(headers);

  //   final http.StreamedResponse streamedResponse = await request.send();
  //   final int statusCode = streamedResponse.statusCode;

  //   final Uint8List responseList = await streamedResponse.stream.toBytes();
  //   final String responseData = String.fromCharCodes(responseList);

  //   if (statusCode == 201) {
  //     return Right(AuthResponseModel.fromJson(
  //       jsonDecode(responseData)
  //     ));
  //   } else {
  //     return const Left("Register Gagal");
  //   }
  // }


  // Future<Either<String, AuthResponseModel>> register(
  //   String name,
  //   String email,
  //   String phone,
  //   String password,
  //   String profilePhoto,
  //   List<int> bytes,
  // ) async {
  //   final uri = Uri.parse('${Variables.baseUrl}/api/register');
  //   var request = http.MultipartRequest('POST', uri);

  //   final multiPartFile = http.MultipartFile.fromBytes(
  //     "profile_photo",
  //     bytes,
  //     filename: profilePhoto,
  //   );

  //   final Map<String, String> fields = {
  //     "name": name,
  //     "email": email,
  //     "phone": phone,
  //     "password": password,
  //   };

  //   final Map<String, String> headers = {
  //     "Content-type": "multipart/form-data"
  //   };

  //   request.files.add(multiPartFile);
  //   request.fields.addAll(fields);
  //   request.headers.addAll(headers);

  //   final http.StreamedResponse streamedResponse = await request.send();
  //   final int statusCode = streamedResponse.statusCode;

  //   final Uint8List responseList = await streamedResponse.stream.toBytes();
  //   final String responseData = String.fromCharCodes(responseList);

  //   if (statusCode == 201) {
  //     return Right(AuthResponseModel.fromJson(
  //       jsonDecode(responseData)
  //     ));
  //   } else {
  //     return const Left("Register Gagal");
  //   }
  // }

  // Login
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel loginRequest
  ) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.171:8000/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: loginRequest.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Login Gagal');
    }
  }

  // Logout
  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.post(
      Uri.parse('http://192.168.0.171:8000/api/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      return const Right('Logout Berhasil');
    } else {
      return const Left('Logout Gagal');
    }
  }
}