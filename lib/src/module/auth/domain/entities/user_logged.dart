import 'package:equatable/equatable.dart';

class UserLogged extends Equatable {
  final String name;

  const UserLogged({required this.name});

  @override
  List<Object?> get props => throw UnimplementedError();

}