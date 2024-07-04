import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/request/sebaran_varietas_request.dart';
import 'package:grapegrow_apps/data/models/responses/add_sebaran_varietas_response.dart';
import 'package:grapegrow_apps/data/models/responses/list_sebaran_varietas_response.dart';
import 'package:http/http.dart' as http;

class SebaranVarietasRouteDatasource {

  // Create Sebaran Varietas
  Future<Either<String, AddSebaranVarietasResponse>> addSebaranVarietas(
    SebaranVarietasRequest sebaranVarietasRequest
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final uri = Uri.parse('http://192.168.0.171:8000/api/sebaran/varietas/isi');
    var request = http.MultipartRequest('POST',  uri);

    final fileName = sebaranVarietasRequest.gambar;

    final multiPartFile = await http.MultipartFile.fromPath(
      "gambar",
      fileName.path,
    );
    request.files.add(multiPartFile);

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authData.accessToken}',
    };

    final Map<String, String> fields = sebaranVarietasRequest.toJson();

    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      return Right(AddSebaranVarietasResponse.fromMap(jsonDecode(responseData)));
    } else {
      return const Left("Gagal Membuat Data Sebaran");
      // return Left('Error: ${jsonDecode(responseData)}');
      // if (statusCode == 400) {
      //   return const Left('Bad Request: Check your input data');
      // } else if (statusCode == 500) {
      //   return const Left('Server Error: Please try again later');
      // } else {
      //   return Left('Error creating data: ${jsonDecode(responseData)}');
      // }
      // // return const Left('Gagal Membuat Data Sebaran');
    }
  }

  // Get All Sebaran Varietas
  Future<Either<String, ListSebaranVarietasResponse>> getAllSebaranVarietas() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse("http://192.168.0.171:8000/api/sebaran/varietas"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      return Right(ListSebaranVarietasResponse.fromJson(response.body));
    } else {
      return const Left('Gagal Memunculkan Data List Sebaran Varietas');
    }
  }
}