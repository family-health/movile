import 'dart:convert';

import 'package:app/src/models/family.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? name;
  String? lastname;
  String? email;
  String? phone;
  String? password;
  String? avatar;
  bool? isActive;
  List<Family>? family;
  String? token;

  User({
    this.id,
    this.name,
    this.lastname,
    this.password,
    this.email,
    this.phone,
    this.avatar,
    this.isActive,
    this.family,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        avatar: json["avatar"],
        isActive: json["isActive"],
        family: json["family"] == null || json["family"] == []
            ? []
            : List<Family>.from(
                json["family"].map((model) => Family.fromJson(model))),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "password": password,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "isActive": isActive,
        "family": family,
        "token": token,
      };
  Map<String, dynamic> toJsonForCreate() => {
        "name": name,
        "lastname": lastname,
        "password": password,
        "email": email,
        "phone": phone,
        "avatar": avatar,
      };
  Map<String, dynamic> toJsonForUpdateWithOutImage() => {
        "name": name,
        "lastname": lastname,
        "phone": phone,
      };
}
