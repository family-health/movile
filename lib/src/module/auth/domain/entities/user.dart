import 'package:equatable/equatable.dart';

//? Equatable extends is used to testing purpose.

class User extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final int height;
  final int weight;
  final String birth;
  final String? avatar;

  const User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.height,
    required this.weight,
    required this.birth,
    this.avatar = "assets/images/avatar/default.png"
  });


  //todo: this empty is aplied when user register, fix it
  static const User empty = User(
    id: "",
    name: "",
    lastname: "",
    email: "",
    phone: "",
    height: 0,
    weight: 0,
    birth: "",
  );

  bool get isEmpty => this == User.empty;

  @override
  List<Object?> get props => [id, name, lastname, email, phone, avatar];
}