import 'dart:convert';

RegisterResponseModel registerResponseFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
    final String id;
    final String name;
    final String lastname;
    final String email;
    final String phone;
    final String password;
    final String gender;
    final String? avatar;
    final double height;
    final double weight;
    final String birth;
    final List<String>? roles;
    final List<dynamic>? family;
    final List<dynamic>? historyLogin;
    final String token;

    RegisterResponseModel({
        required this.id,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        required this.password,
        required this.gender,
        this.avatar,
        required this.height,
        required this.weight,
        required this.birth,
        required this.roles,
        required this.family,
        required this.historyLogin,
        required this.token,
    });

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        gender: json["gender"] ?? "-",
        avatar: json["avatar"],
        height: double.parse(json["height"].toString()),
        weight: double.parse(json["weight"].toString()),
        birth: json["birth"] ?? "-",
        roles: (json["roles"] != null) ? List<String>.from(json["roles"]) : null,
        family: (json["family"] != null) ? List<dynamic>.from(json["family"]) : null,
        historyLogin: (json["history_login"] != null) ?  List<dynamic>.from(json["history_login"]) : null,
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "gender": gender,
        "avatar": avatar,
        "heigth": height,
        "weight": weight,
        "birth": birth,
        "roles": roles,
        "family": family,
        "history_login": historyLogin,
        "token": token,
    };
}
