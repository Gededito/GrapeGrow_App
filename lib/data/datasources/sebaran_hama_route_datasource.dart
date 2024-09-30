import 'dart:convert';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/request/sebaran_hama_request.dart';
import 'package:grapegrow_apps/data/models/request/update_sebaran_hama.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_hama_response.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/list_sebaran_hama_response.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:http/http.dart' as http;

class SebaranHamaRouteDatasource {

  // Create Sebaran Hama
  Future<Either<String, AddSebaranHamaResponse>> addSebaranHama(
    SebaranHamaRequest sebaranHamaRequest,
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final uri = Uri.parse("${Variables.baseUrl}/api/sebaran_penyakit/add");
    var request = http.MultipartRequest('POST', uri);

    final fileName = sebaranHamaRequest.gambar;
    final multiPartFile = await http.MultipartFile.fromPath(
      "gambar",
      fileName.path,
    );
    request.files.add(multiPartFile);
  
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authData!.accessToken}',
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
      Uri.parse("${Variables.baseUrl}/api/sebaran_penyakit"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData!.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      return Right(ListSebaranHamaResponse.fromJson(response.body));
    } else {
      return const Left('Gagal Memunculkan Data List Sebaran Hama');
    }
  }
  
  // Update Sebaran Hama
  Future<Either<String, AddSebaranHamaResponse>> updateSebaranHama(
      UpdateSebaranHama sebaranHamaRequest, int id
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final uri = Uri.parse('${Variables.baseUrl}/api/sebaran_penyakit/$id');

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    final body = jsonEncode(sebaranHamaRequest.toMap());

    final response = await http.put(uri, headers: headers, body: body);
    final statusCode = response.statusCode;
    
    if (statusCode == 200) {
      return Right(AddSebaranHamaResponse.fromMap(jsonDecode(response.body)));
    } else {
      return const Left("Gagal Memperbarui Data Sebaran");
    }
  }
  
  // Delete Sebaran Hama
  Future<Either<String, String>> deleteSebaranHama(int id) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.delete(
      Uri.parse('${Variables.baseUrl}/api/sebaran_penyakit/delete/$id'),
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