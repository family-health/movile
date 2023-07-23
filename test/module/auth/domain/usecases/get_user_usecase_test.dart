import 'package:app/src/module/auth/domain/usecases/get_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/module/auth/auth_module.dart';

void main() {
  group("Get authenticated user usecase", () {
    final AuthRepository repository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());
    GetUserUsecase(repository);

    test("When authenticated user exists", () => null);
    test("When authenticated user not exists", () => null);
  });
}