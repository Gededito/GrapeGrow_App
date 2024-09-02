import 'dart:convert';

class AuthResponseModel {
  final String accessToken;
  final User user;

  AuthResponseModel({
    required this.accessToken,
    required this.user,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        accessToken: json["access_token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
    "access_token": accessToken,
    "user": user.toMap(),
  };
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String roles;
  final String profilePhoto;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
    required this.profilePhoto,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    phone: json["phone"] ?? "",
    roles: json["roles"] ?? "-",
    profilePhoto: json["profile_photo"] ?? ""
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "roles": roles,
    "profile_photo": profilePhoto,
  };
}