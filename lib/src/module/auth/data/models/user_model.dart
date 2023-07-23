import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';

class UserModel {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String? avatar;
  final List<String>? roles;
  final List<dynamic>? family;

  const UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    this.avatar,
    this.roles = const [],
    this.family = const [],
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "roles": List<dynamic>.from(roles!.map((x) => x)),
        "family": List<String>.from(family!.map((x) => x)),
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        family: List<String>.from(json["family"].map((x) => x)),
        roles: List<String>.from(json["roles"].map((x) => x)),
      );

  factory UserModel.fromLoginRespondeModel(LoginResponseModel model) => UserModel(
        id: model.id,
        name: model.name,
        lastname: model.lastname,
        email: model.email,
        phone: model.phone,
        avatar: model.avatar,
        family: model.family,
      );

  User toEntity() => User(
        id: id,
        name: name,
        lastname: lastname,
        email: email,
        phone: phone,
        avatar: avatar,
      );
}
