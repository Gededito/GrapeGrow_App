import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/hama_response_model.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:http/http.dart' as http;

class HamaRemoteDatasource {
  
  // Get All Hama
  Future<Either<String, HamaResponseModel>> getAllHama() async {
    final authData = await AuthLocalDatasource().getAuthData();
    
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/penyakit'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData!.accessToken}',
      }
    );
    
    if (response.statusCode == 200) {
      return Right(HamaResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal Mengambil Keseluruhan Data Hama');
    }
  }
  
  // Get By Id Varietas
  Future<Either<String, HamaResponseModel>> byIdHama(String id) async {
    final authData = await AuthLocalDatasource().getAuthData();
    
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/penyakit?id=$id'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData!.accessToken}',
      }
    );
    
    if (response.statusCode == 200) {
      return Right(HamaResponseModel.fromJson(response.body));
    } else {
      return const Left("Data Tidak Sesuai");
    }
  }
}