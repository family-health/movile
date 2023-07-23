import 'package:equatable/equatable.dart';

//? Equatable extends is used to testing purpose.

class User extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String? avatar;

  const User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    this.avatar = "assets/images/avatar/default.png"
  });

  static const User empty = User(id: "", name: "", lastname: "", email: "", phone: "");

  bool get isEmpty => this == User.empty;

  @override
  List<Object?> get props => [id, name, lastname, email, phone, avatar];
}