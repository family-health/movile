import 'package:app/src/module/auth/data/models/register_response_model.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';

class UserModel {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String? avatar;
  final double height;
  final double weight;
  final String birth;

  const UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    this.avatar,
    required this.height,
    required this.weight,
    required this.birth
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "height": height,
        "weight": weight,
        "birth": birth,
        "email": email,
        "phone": phone,
        "avatar": avatar,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["avatar"],
        height: double.parse(json["height"].toString()),
        weight: double.parse(json["weight"].toString()),
        birth: json["birth"] ?? "-",
      );

  factory UserModel.fromRegisterRespondeModel(RegisterResponseModel model) => UserModel(
        id: model.id,
        name: model.name,
        lastname: model.lastname,
        email: model.email,
        phone: model.phone,
        avatar: model.avatar,
        height: model.height,
        weight: model.weight,
        birth: model.birth,
      );

  User toEntity() => User(
        id: id,
        name: name,
        lastname: lastname,
        email: email,
        phone: phone,
        height: height,
        weight: weight,
        birth: birth,
        avatar: avatar,
      );
}
