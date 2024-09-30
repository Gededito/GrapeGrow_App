import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_hama_response.dart';

class ListSebaranHamaResponse {
  final String status;
  final List<SebaranHama> sebaranHama;

  ListSebaranHamaResponse({
    required this.status,
    required this.sebaranHama,
  });

  factory ListSebaranHamaResponse.fromJson(String str) =>
      ListSebaranHamaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListSebaranHamaResponse.fromMap(Map<String, dynamic> json) => ListSebaranHamaResponse(
    status: json["status"],
    sebaranHama: List<SebaranHama>.from(json["sebaranPenyakit"].map((x) => SebaranHama.fromMap(x)))
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "sebaranPenyakit": List<SebaranHama>.from(sebaranHama.map((x) => x.toMap())),
  };
}