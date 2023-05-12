import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String username;
  final String password;

  const Register({required this.username, required this.password});
  
  @override
  List<Object?> get props => [username, password];
}