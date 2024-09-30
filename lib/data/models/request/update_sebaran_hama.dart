import 'dart:convert';

class UpdateSebaranHama {
  final String? nama;
  final String? gejala;
  final String? solusi;
  final double? lat;
  final double? lon;

  UpdateSebaranHama({
    this.nama,
    this.gejala,
    this.solusi,
    this.lat,
    this.lon,
  });

  factory UpdateSebaranHama.fromJson(String str) =>
      UpdateSebaranHama.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateSebaranHama.fromMap(Map<String, dynamic> json) =>
      UpdateSebaranHama(
        nama: json["nama"],
        gejala: json["gejala"],
        solusi: json["solusi"],
        lat: json["lat"],
        lon: json["lon"]
      );

  Map<String, dynamic> toMap() => {
    "nama": nama,
    "gejala": gejala,
    "solusi": solusi,
    "lat": lat,
    "lon": lon,
  };
}