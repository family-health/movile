import 'package:equatable/equatable.dart';

//? Equatable extends is used to testing purpose.

class User extends Equatable {
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

  const User(
      {required this.id,
      required this.name,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.password,
      required this.avatar,
      required this.roles,
      required this.family,
      required this.historyLogin,
      required this.token});

  @override
  List<Object?> get props => [
        id,
        name,
        lastname,
        email,
        phone,
        password,
        avatar,
        roles,
        family,
        historyLogin,
        token
      ];
}
