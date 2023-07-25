import 'package:app/src/module/auth/domain/usecases/get_stored_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/module/auth/auth_module.dart';

void main() {
  group("Get authenticated user usecase", () {
    final AuthRepository repository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());
    GetStoredUserUsecase(repository);

    test("When authenticated user exists", () => null);
    test("When authenticated user not exists", () => null);
  });
}