import 'dart:convert';

import 'package:grapegrow_apps/data/models/responses/add_sebaran_varietas_response.dart';

class ListSebaranVarietasResponse {
  final String status;
  final List<SebaranVarietas> sebaranVarietas;

  ListSebaranVarietasResponse({
    required this.status,
    required this.sebaranVarietas,
  });

  factory ListSebaranVarietasResponse.fromJson(String str) =>
      ListSebaranVarietasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListSebaranVarietasResponse.fromMap(Map<String, dynamic> json) => ListSebaranVarietasResponse(
    status: json["status"],
    sebaranVarietas: List<SebaranVarietas>.from(json["sebaranVarietas"].map((x) => SebaranVarietas.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "sebaranVarietas": List<SebaranVarietas>.from(sebaranVarietas.map((x) => x.toMap())),
  };
}