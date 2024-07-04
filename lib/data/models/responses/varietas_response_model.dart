import 'dart:convert';

class VarietasResponseModel {
  final String status;
  final List<Varietas> data;

  VarietasResponseModel({
    required this.status,
    required this.data,
  });

  factory VarietasResponseModel.fromJson(String str) => VarietasResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VarietasResponseModel.fromMap(Map<String, dynamic> json) => VarietasResponseModel(
    status: json["status"],
    data: List<Varietas>.from(json["data"].map((x) => Varietas.fromMap(x)))
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": List<Varietas>.from(data.map((x) => x.toMap()))
  };
}

class Varietas {
  final int id;
  final String nama;
  final String deskripsi;
  final String karakteristik;
  final String gambarVarietas;
  final DateTime createdAt;
  final DateTime updatedAt;

  Varietas({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.karakteristik,
    required this.gambarVarietas,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Varietas.fromJson(String str) => Varietas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Varietas.fromMap(Map<String, dynamic> json) => Varietas(
    id: json["id"],
    nama: json["nama"],
    deskripsi: json["deskripsi"],
    karakteristik: json["karakteristik"],
    gambarVarietas: json["gambar"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nama": nama,
    "deskripsi": deskripsi,
    "karakteristik": karakteristik,
    "gambar": gambarVarietas,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}