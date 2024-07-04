import 'dart:io';

class SebaranHamaRequest {
  final String nama;
  final String solusi;
  final String gejala;
  final File gambar;
  final double? lat;
  final double? lon;

  SebaranHamaRequest({
    required this.nama,
    required this.gejala,
    required this.solusi,
    required this.gambar,
    this.lat,
    this.lon,
  });

  Map<String, String> toJson() {
    if (lat == null && lon == null) {
      return {
        'nama': nama,
        'gejala': gejala,
        'solusi': solusi,
      };
    }

    return {
      'nama': nama,
      'gejala': gejala,
      'solusi': solusi,
      'lat': lat?.toString() ?? '',
      'lon': lon?.toString() ?? '',
    };
  }
}