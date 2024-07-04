import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';

class AddSebaranHamaResponse {
  final String status;
  final String message;
  final SebaranHama sebaranHama;

  AddSebaranHamaResponse({
    required this.status,
    required this.message,
    required this.sebaranHama,
  });

  factory AddSebaranHamaResponse.fromJson(String str) => AddSebaranHamaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddSebaranHamaResponse.fromMap(Map<String, dynamic> json) => AddSebaranHamaResponse(
    status: json["status"],
    message: json["message"],
    sebaranHama: SebaranHama.fromMap(json["sebaranHama"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "sebaranHama": sebaranHama.toJson(),
  };
}

class SebaranHama {
  final int id;
  final int userId;
  final String nama;
  final String gejala;
  final String solusi;
  final String gambar;
  final double lat;
  final double lon;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? user;

  SebaranHama({
    required this.id,
    required this.userId,
    required this.nama,
    required this.gejala,
    required this.solusi,
    required this.gambar,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  factory SebaranHama.fromJson(String str) => SebaranHama.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SebaranHama.fromMap(Map<String, dynamic> json) => SebaranHama(
    id: json["id"],
    userId: json["user_id"],
    nama: json["nama"],
    gejala: json["gejala"],
    solusi: json["solusi"],
    gambar: json["gambar"],
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
    "gejala": gejala,
    "solusi": solusi,
    "gambar": gambar,
    "lat": lat,
    "lon": lon,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "user": user?.toMap(),
  };
}