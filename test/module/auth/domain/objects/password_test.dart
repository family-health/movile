import 'package:app/src/module/auth/domain/objects/password.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('Password', () {
    test("Password is correct", (){
      expect(()=> Password((b)=> b.value = 'password123'), returnsNormally);
    });

    test("Password is invalid", (){
      expect(()=> Password((b)=> b.value = 'pass123'), throwsArgumentError);
      expect(()=> Password((b)=> b.value = 'password!'), throwsArgumentError);
    });
    
    test('Two Password instances with same values are equal', () {
      final password1 = Password((b) => b.value = 'password123');
      final password2 = Password((b) => b.value = 'password123');
      expect(password1, equals(password2));
    });
  });

}