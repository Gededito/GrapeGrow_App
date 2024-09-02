import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/modul/get_all_modul_response.dart';
import 'package:grapegrow_apps/data/models/responses/modul/get_video_modul_id_response.dart';
import 'package:http/http.dart' as http;

class ModulBudidayaRemoteDatasource {

  // Get All Modul
  Future<Either<String, GetAllModulResponse>> getAllModul() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/modul_budidaya'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authData!.accessToken}',
        }
      );

      if (response.statusCode == 200) {
        return Right(GetAllModulResponse.fromJson(response.body));
      } else {
        return const Left("Failed Get All Modul");
      }
    } on SocketException {
      return const Left("No Internet Connection");
    } catch (e) {
      return Left("An error occurred: ${e.toString()}");
    }
  }

  // Get Video Modul By Id
  Future<Either<String, GetModulByIdResponse>> getVideoModulById(
      int id,
  ) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final response = await http.get(
        Uri.parse("${Variables.baseUrl}/api/modul_budidaya/$id"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authData!.accessToken}',
        }
      );

      if (response.statusCode == 200) {
        return Right(GetModulByIdResponse.fromMap(jsonDecode(response.body)));
      } else {
        return const Left("Gagal Memunculkan Data");
      }
    } on SocketException {
      return const Left("No Internet Connection");
    } catch (e) {
      return Left("An error occurred: ${e.toString()}");
    }
  }
}