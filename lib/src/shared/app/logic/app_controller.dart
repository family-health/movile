import 'dart:async';

import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/module/auth/domain/usecases/get_stored_user_usecase.dart';
import 'package:app/src/module/common/domain/usecases/usecases.dart';
import 'package:get/get.dart';

enum AppStatus { unknown, authenticated, unauthenticated }

class AppController extends GetxController {
  final GetStoredUserUsecase getAuthUserUsecase;
  final LogoutUsecase logoutUsecase;

  AppController({required this.getAuthUserUsecase, required this.logoutUsecase});

  AppStatus status = AppStatus.unknown;
  User? user = User.empty;

  @override
  void onInit() {
    super.onInit();

    User? storedUser = getAuthUserUsecase.call(NoParams());

    if (storedUser == null || storedUser == User.empty) {
      status = AppStatus.authenticated;
    } else {
      user = storedUser;
      status = AppStatus.authenticated;
    }
  }

  void logout() async {
    unawaited(logoutUsecase(NoParams()));
  }
}