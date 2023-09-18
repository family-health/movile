import 'dart:convert';

LoginResponseModel loginResponseFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    final String id;
    final String name;
    final String lastname;
    final String email;
    final String phone;
    final String password;
    final String? avatar;
    final List<String>? roles;
    final List<dynamic>? family;
    final List<dynamic>? historyLogin;
    final String token;

    LoginResponseModel({
        required this.id,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        required this.password,
        this.avatar = "assets/avatar/default.png",
        this.roles = const [],
        this.family = const [],
        this.historyLogin = const [],
        required this.token,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        avatar: json["avatar"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        family: List<dynamic>.from(json["family"].map((x) => x)),
        // historyLogin: List<dynamic>.from(json["history_login"].map((x) => x)),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "avatar": avatar,
        "roles": List<dynamic>.from(roles!.map((a) => a)),
        "family": List<dynamic>.from(family!.map((x) => x)),
        "history_login": List<dynamic>.from(historyLogin!.map((x) => x)),
        "token": token,
    };
}
