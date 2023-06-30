import 'package:app/src/shared/domain/entities/user.dart';

class LoggedUser extends User {
  final String id;
  final String token;
  const LoggedUser(this.id, this.token, {required super.name, required super.lastname, required super.email, required super.phone});
}