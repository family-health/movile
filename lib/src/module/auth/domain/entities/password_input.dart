import 'package:formz/formz.dart';

enum PasswordInputError { empty }

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.dirty(super.value) : super.dirty();

  @override
  validator(value) {
    throw UnimplementedError();
  }
}