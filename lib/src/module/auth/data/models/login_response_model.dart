import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    final String id;
    final String name;
    final String lastname;
    final String email;
    final String phone;
    final String password;
    final String avatar;
    final List<String> roles;
    final List<dynamic> family;
    final List<dynamic> historyLogin;
    final String token;

    LoginResponse({
        required this.id,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        required this.password,
        required this.avatar,
        required this.roles,
        required this.family,
        required this.historyLogin,
        required this.token,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        avatar: json["avatar"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        family: List<dynamic>.from(json["family"].map((x) => x)),
        historyLogin: List<dynamic>.from(json["history_login"].map((x) => x)),
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
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "family": List<dynamic>.from(family.map((x) => x)),
        "history_login": List<dynamic>.from(historyLogin.map((x) => x)),
        "token": token,
    };
}
