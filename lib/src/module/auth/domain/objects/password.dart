import 'package:built_value/built_value.dart';

part 'password.g.dart';

abstract class Password implements Built<Password, PasswordBuilder> {
    String get value;


  Password._(){
    if (value.length < 3) {
      throw ArgumentError('Password lenght must be more than equal or more than 3');
    }
  }

  factory Password([void Function(PasswordBuilder) updates]) = _$Password;
}