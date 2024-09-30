import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';

class AddSebaranVarietasResponse {
  final String status;
  final String message;
  final SebaranVarietas sebaranVarietas;

  AddSebaranVarietasResponse({
    required this.status,
    required this.message,
    required this.sebaranVarietas,
  });

  factory AddSebaranVarietasResponse.fromJson(String str) => AddSebaranVarietasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddSebaranVarietasResponse.fromMap(Map<String, dynamic> json) => AddSebaranVarietasResponse(
    status: json["status"],
    message: json["message"],
    sebaranVarietas: SebaranVarietas.fromMap(json["sebaranVarietas"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "sebaranVarietas": sebaranVarietas.toMap()
  };
}

class SebaranVarietas {
  final int id;
  final int userId;
  final String nama;
  final String deskripsi;
  final String gambar;
  final String jumlahTanaman;
  final bool jualBibit;
  final double lat;
  final double lon;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? user;

  SebaranVarietas({
    required this.id,
    required this.userId,
    required this.nama,
    required this.deskripsi,
    required this.gambar,
    required this.jumlahTanaman,
    required this.jualBibit,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
    this.user
  });

  factory SebaranVarietas.fromJson(String str) => SebaranVarietas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SebaranVarietas.fromMap(Map<String, dynamic> json) => SebaranVarietas(
    id: json["id"],
    userId: json["user_id"],
    nama: json["nama"],
    deskripsi: json["deskripsi"],
    gambar: json["gambar"],
    jumlahTanaman: json["jumlah_tanaman"],
    jualBibit: json["menjual_bibit"] == 1 ? true : false,
    lat: json["lat"] is double ? json["lat"] : double.parse(json["lat"].toString()),
    lon: json["lon"] is double ? json["lon"] : double.parse(json["lon"].toString()),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: json["user"] != null ? User.fromMap(json["user"]) : null
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "nama": nama,
    "deskripsi": deskripsi,
    "gambar": gambar,
    "jumlah_tanaman": jumlahTanaman,
    "menjual_bibit": jualBibit,
    "lat": lat,
    "lon": lon,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}