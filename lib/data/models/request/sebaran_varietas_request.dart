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
}