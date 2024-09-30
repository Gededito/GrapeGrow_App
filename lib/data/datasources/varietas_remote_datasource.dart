import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/varietas_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:grapegrow_apps/core/constants/constant.dart';

class VarietasRemoteDatasource {

  // Get All Varietas
  Future<Either<String, VarietasResponseModel>> getAllVarietas() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/varietas'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData!.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      return Right(VarietasResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal Mengambil Keseluruhan Data Varietas');
    }
  }

  // Get By Id Varietas
  Future<Either<String, VarietasResponseModel>> byIdVarietas(String id) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/varietas?id=$id'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData!.accessToken}',
      }
    );

    if (response.statusCode == 200) {
      return Right(VarietasResponseModel.fromJson(response.body));
    } else {
      return const Left("Data Tidak Sesuai");
    }
  }
}