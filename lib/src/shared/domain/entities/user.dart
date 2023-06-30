import 'package:equatable/equatable.dart';

//? Equatable extends is used to testing purpose.

class User extends Equatable {
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String? avatar;

  const User({
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    this.avatar,
  });

  @override
  List<Object?> get props => [name, lastname, email, phone, avatar];
}
