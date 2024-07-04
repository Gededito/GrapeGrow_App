import 'dart:convert';

class RegisterRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  // final String? profilePhoto;
  // final List<int>? bytes;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    // this.profilePhoto,
    // this.bytes,
  });

  factory RegisterRequestModel.fromJson(String str) =>
      RegisterRequestModel.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) =>
      RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        // profilePhoto: json['profile_photo'] ?? "-",
        // bytes: List<int>.from(json['bytes'] ?? [])
      );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    // "profile_photo": profilePhoto,
  };
}