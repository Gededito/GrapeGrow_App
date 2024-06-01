class ForumModel {
  String? namaPengguna;
  String? tanggalBuat;
  String? imagePath;
  String? contentText;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? liked;

  ForumModel({
    this.namaPengguna,
    this.tanggalBuat,
    this.imagePath,
    this.contentText,
    this.liked,
    this.createdAt,
    this.updatedAt,
  });
}