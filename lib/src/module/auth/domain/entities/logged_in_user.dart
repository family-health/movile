import 'package:app/src/module/auth/domain/entities/user.dart';

class LoggedInUser extends User {
  final String token;

  const LoggedInUser({
    required this.token,
    required super.id,
    required super.name,
    required super.lastname,
    required super.email,
    required super.phone,
    required super.avatar,
  });

  static const empty = LoggedInUser(
    token: "-",
    id: "-",
    name: "-",
    lastname: "-",
    email: "-",
    phone: "-",
    avatar: "-",
  );

  LoggedInUser copyWith({
    String? token,
    String? id,
    String? name,
    String? lastname,
    String? email,
    String? phone,
    String? avatar,
  }) {
    return LoggedInUser(
      token: token ?? this.token,
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
    );
  }
  
  @override
  List<Object?> get props => [
        token,
        id,
        name,
        lastname,
        email,
        phone,
        avatar,
      ];
}
