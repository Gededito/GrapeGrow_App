import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/modul/modul_budidaya_response.dart';

class GetModulByIdResponse {
  final String status;
  final ModulBudidaya modulBudidaya;

  GetModulByIdResponse({
    required this.status,
    required this.modulBudidaya,
  });

  factory GetModulByIdResponse.from(String str) => GetModulByIdResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetModulByIdResponse.fromMap(Map<String, dynamic> json) =>
    GetModulByIdResponse(
      status: json["status"],
      modulBudidaya: ModulBudidaya.fromMap(json["modulBudidaya"]),
    );

  Map<String, dynamic> toMap() => {
    "status": status,
    "modulBudidaya": modulBudidaya.toMap(),
  };
}