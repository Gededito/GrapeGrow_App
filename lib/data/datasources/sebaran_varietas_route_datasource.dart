import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/request/sebaran_varietas_request.dart';
import 'package:grapegrow_apps/data/models/request/update_sebaran_varietas.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_varietas_response.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/list_sebaran_varietas_response.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:http/http.dart' as http;

class SebaranVarietasRouteDatasource {

  // Create Sebaran Varietas
  Future<Either<String, AddSebaranVarietasResponse>> addSebaranVarietas(
    SebaranVarietasRequest sebaranVarietasRequest
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final uri = Uri.parse('${Variables.baseUrl}/api/sebaran_varietas/add');
    var request = http.MultipartRequest('POST',  uri);

    final fileName = sebaranVarietasRequest.gambar;
    final multiPartFile = await http.MultipartFile.fromPath(
      "gambar",
      fileName.path,
    );
    request.files.add(multiPartFile);

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authData!.accessToken}',
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
    }
  }

  // Get All Sebaran Varietas
  Future<Either<String, ListSebaranVarietasResponse>> getAllSebaranVarietas() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse("${Variables.baseUrl}/api/sebaran_varietas"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData!.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      return Right(ListSebaranVarietasResponse.fromJson(response.body));
    } else {
      return const Left('Gagal Memunculkan Data List Sebaran Varietas');
    }
  }
  
  Future<Either<String, AddSebaranVarietasResponse>> updateSebaranVarietas(
      UpdateSebaranVarietas sebaranVarietasRequest, int id
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final uri = Uri.parse('${Variables.baseUrl}/api/sebaran_varietas/$id');

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    final body = jsonEncode(sebaranVarietasRequest.toMap());

    final response = await http.put(uri, headers: headers, body: body);
    final statusCode = response.statusCode;

    if (statusCode == 200) {
      return Right(AddSebaranVarietasResponse.fromMap(jsonDecode(response.body)));
    } else {
      return const Left("Gagal Memperbarui Data Sebaran");
    }
  }

  // Delete Sebaran Varietas
  Future<Either<String, String>> deleteSebaranVarietas(int id) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.delete(
      Uri.parse('${Variables.baseUrl}/api/sebaran_varietas/delete/$id'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData!.accessToken}',
      }
    );
    
    if (response.statusCode == 200) {
      return const Right("Data Berhasil Dihapus");
    } else {
      return const Left("Gagal Menghapus Data");
    }
  }
}