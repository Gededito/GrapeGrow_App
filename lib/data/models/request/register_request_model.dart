import 'dart:convert';
import 'dart:io';

class RegisterRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final File gambar;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.gambar
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
        gambar: json['profile_photo'],
      );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "profile_photo": gambar,
  };
}