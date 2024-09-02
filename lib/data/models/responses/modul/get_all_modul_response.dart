import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/modul/modul_budidaya_response.dart';

class GetAllModulResponse {
  final String status;
  final List<ModulBudidaya> modulBudidaya;

  GetAllModulResponse({
    required this.status,
    required this.modulBudidaya,
  });

  factory GetAllModulResponse.fromJson(String str) => GetAllModulResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllModulResponse.fromMap(Map<String, dynamic> json) =>
    GetAllModulResponse(
      status: json["status"],
      modulBudidaya: List<ModulBudidaya>.from(json["modulBudidaya"].map((x) => ModulBudidaya.fromMap(x)))
    );

  Map<String, dynamic> toMap() => {
    "status": status,
    "modulBudidaya": List<ModulBudidaya>.from(modulBudidaya.map((x) => x.toMap())),
  };
}