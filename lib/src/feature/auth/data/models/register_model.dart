import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String? username;
  final String? password;

  const RegisterModel({this.username, this.password});
  
  @override
  List<Object?> get props => throw UnimplementedError();
}