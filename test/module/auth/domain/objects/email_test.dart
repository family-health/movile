import 'package:app/src/module/auth/domain/objects/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email', () {
    test("Email correct format", () {
      expect(() => Email((b) => b.value = 'test@test.com'), returnsNormally);
    });

    test("Email invalid format", () {
      expect(() => Email((b) => b.value = 'test@'), throwsArgumentError);
    });

    test("Email invalid format", () {
      expect(() => Email((b) => b.value = 'test@'), throwsArgumentError);
    });
  });
}