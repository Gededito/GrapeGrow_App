import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/request/sebaran_hama_request.dart';
import 'package:grapegrow_apps/data/models/responses/add_sebaran_hama_response.dart';
import 'package:grapegrow_apps/data/models/responses/list_sebaran_hama_response.dart';
import 'package:http/http.dart' as http;

class SebaranHamaRouteDatasource {

  // Create Sebaran Hama
  Future<Either<String, AddSebaranHamaResponse>> addSebaranHama(
    SebaranHamaRequest sebaranHamaRequest,
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final uri = Uri.parse("http://192.168.0.171:8000/api/sebaran/hama/tambah");
    var request = http.MultipartRequest('POST', uri);

    final fileName = sebaranHamaRequest.gambar;

    final multiPartFile = await http.MultipartFile.fromPath(
      "gambar",
      fileName.path,
    );
    request.files.add(multiPartFile);
  
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authData.accessToken}',
    };

    final Map<String, String> fields = sebaranHamaRequest.toJson();

    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      return Right(AddSebaranHamaResponse.fromMap(jsonDecode(responseData)));
    } else {
      return const Left('Gagal Menambahkan Data Sebaran Hama');
    }
  }

  // Get All Sebaran Hama
  Future<Either<String, ListSebaranHamaResponse>> getAllSebaranHama() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse("http://192.168.0.171:8000/api/sebaran/hama"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      return Right(ListSebaranHamaResponse.fromJson(response.body));
    } else {
      return const Left('Gagal Memunculkan Data List Sebaran Hama');
    }
  }
}