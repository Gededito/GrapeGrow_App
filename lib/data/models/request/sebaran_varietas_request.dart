import 'dart:io';

class SebaranVarietasRequest {
  final String nama;
  final String deskripsi;
  final String jumlahTanaman;
  int? jualBibit;
  final File gambar;
  final double? lat;
  final double? lon;

  SebaranVarietasRequest({
    required this.nama,
    required this.deskripsi,
    required this.jumlahTanaman,
    this.jualBibit,
    required this.gambar,
    this.lat,
    this.lon,
  });

  Map<String, String> toJson() {
    if (lat == null && lon == null) {
      return {
        'nama': nama,
        'deskripsi': deskripsi,
        'jumlah_tanaman': jumlahTanaman,
      };
    }

    return {
      'nama': nama,
      'deskripsi': deskripsi,
      'jumlah_tanaman': jumlahTanaman,
      'menjual_bibit': jualBibit.toString(),
      'lat': lat?.toString() ?? '',
      'lon': lon?.toString() ?? ''
    };
  }

  void setJualBibit(bool value) {
    jualBibit = value ? 1 : 0;
  }

  // factory SebaranVarietasRequest.fromJson(String str) =>
  //     SebaranVarietasRequest.fromJson(json.decode(str));

  // String toJson() => json.encode(toMap());

  // factory SebaranVarietasRequest.fromMap(Map<String, dynamic> json) =>
  //     SebaranVarietasRequest(
  //       nama: json["nama"],
  //       deskripsi: json["deskripsi"],
  //       jumlahTanaman: json["jumlah_tanaman"],
  //       jualBibit: json["menjual_bibit"] == 1 ? true : false,
  //       gambar: json["gambar"],
  //       lat: json["lat"],
  //       lon: json["lon"],
  //     );

  // Map<String, dynamic> toMap() => {
  //   "nama": nama,
  //   "deskripsi": deskripsi,
  //   "jumlah_tanaman": jumlahTanaman,
  //   "menjual_bibit": jualBibit,
  //   "gambar": gambar,
  //   "lat": lat,
  //   "lon": lon
  // };
}