import 'dart:convert';

class UpdateSebaranVarietas {
  final String? nama;
  final String? deskripsi;
  final String? jumlahTanaman;
  int? jualBibit;
  final double? lat;
  final double? lon;

  UpdateSebaranVarietas({
    this.nama,
    this.deskripsi,
    this.jumlahTanaman,
    this.jualBibit,
    this.lat,
    this.lon,
  });

  factory UpdateSebaranVarietas.fromJson(String str) =>
      UpdateSebaranVarietas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateSebaranVarietas.fromMap(Map<String, dynamic> json) =>
      UpdateSebaranVarietas(
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        jumlahTanaman: json["jumlah_tanaman"],
        jualBibit: json["menjual_bibit"],
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toMap() => {
    "nama": nama,
    "deskripsi": deskripsi,
    "jumlah_tanaman": jumlahTanaman,
    "menjual_bibit": jualBibit,
    "lat": lat,
    "lon": lon,
  };

  void setJualBibit(bool value) {
    jualBibit = value ? 1 : 0;
  }
}