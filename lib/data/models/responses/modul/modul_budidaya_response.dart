import 'dart:convert';

class ModulBudidaya {
  final int id;
  final String name;
  final String about;
  final String thumbnailCategory;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Video> videos;

  ModulBudidaya ({
    required this.id,
    required this.name,
    required this.about,
    required this.thumbnailCategory,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.videos,
  });

  factory ModulBudidaya.fromJson(String str) => ModulBudidaya.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModulBudidaya.fromMap(Map<String, dynamic> json) =>
    ModulBudidaya(
      id: json["id"],
      name: json["name"],
      about: json["about"],
      thumbnailCategory: json["thumbnail_category"],
      deletedAt: json["deleted_at"] != null ? DateTime.parse(json["deleted_at"]) : null,
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      videos: List<Video>.from(json["videos"]?.map((x) => Video.fromMap(x)) ?? []),
    );

  Map<String, dynamic> toMap() =>  {
    "id":  id,
    "name": name,
    "about": about,
    "thumbnail_category": thumbnailCategory,
    "deleted_at": deletedAt?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "videos": List<Video>.from(videos.map((x) => x.toMap())),
  };
}

class Video {
  final int id;
  final String nama;
  final String pathVideo;
  final String thumbnailVideo;
  final int categoryClassesId;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Video({
    required this.id,
    required this.nama,
    required this.pathVideo,
    required this.thumbnailVideo,
    required this.categoryClassesId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Video.fromJson(String str) => Video.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Video.fromMap(Map<String, dynamic> json) =>
    Video(
      id: json["id"],
      nama: json["nama"],
      pathVideo: json["path_video"],
      thumbnailVideo: json["thumbnail_video"],
      categoryClassesId: json["category_classes_id"],
      deletedAt: json["deleted_at"] != null ? DateTime.parse(json["deleted_at"]) : null,
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );

  Map<String, dynamic> toMap() => {
    'id': id,
    'nama': nama,
    "path_video": pathVideo,
    "thumbnail_video": thumbnailVideo,
    "category_classes_id": categoryClassesId,
    "deleted_at": deletedAt?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}