import 'package:built_value/built_value.dart';

part 'email.g.dart';

abstract class Email implements Built<Email, EmailBuilder> {
  String get value;

  Email._() {
    final RegExp emailRexExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (!emailRexExp.hasMatch(value)) {
      throw ArgumentError('Invalid email format');
    }
  }

  factory Email([void Function(EmailBuilder) updates]) = _$Email;
}