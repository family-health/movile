import 'package:formz/formz.dart';

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.dirty(super.value) : super.dirty();

  @override
  EmailInputError? validator(String value) {
    throw UnimplementedError();
  }
}