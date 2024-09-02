import 'dart:convert';

class HamaResponseModel {
  final String status;
  final List<Hama> penyakitAnggur;

  HamaResponseModel({
    required this.status,
    required this.penyakitAnggur,
  });

  factory HamaResponseModel.fromJson(String str) =>
      HamaResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HamaResponseModel.fromMap(Map<String, dynamic> json) =>
      HamaResponseModel(
        status: json["status"],
        penyakitAnggur: List<Hama>.from(json["penyakitAnggur"].map((x) => Hama.fromMap(x)))
      );

  Map<String, dynamic> toMap() => {
    "status": status,
    "penyakitAnggur": List<Hama>.from(penyakitAnggur.map((x) => x.toMap()))
  };
}

class Hama {
  final int id;
  final String nama;
  final String gejala;
  final String solusi;
  final String penyebab;
  final String gambar;
  final DateTime createdAt;
  final DateTime updatedAt;

  Hama({
    required this.id,
    required this.nama,
    required this.gejala,
    required this.solusi,
    required this.penyebab,
    required this.gambar,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Hama.fromJson(String str) => Hama.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hama.fromMap(Map<String, dynamic> json) => Hama(
    id: json["id"],
    nama: json["nama"],
    gejala: json["gejala"],
    solusi: json["solusi"],
    penyebab: json["penyebab"],
    gambar: json["gambar"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nama": nama,
    "gejala": gejala,
    "solusi": solusi,
    "penyebab": penyebab,
    "gambar": gambar,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}