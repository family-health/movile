import 'dart:async';

import 'package:get/get.dart';

import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/domain/usecases/get_stored_token_usecase.dart';
export 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/@core/usecases/usecases.dart';

enum AppStatus { unknown, authenticated, unauthenticated }

class AppController extends GetxController {
  final IAuthRepository authRepository;

  AppController(this.authRepository);

  late GetStoredUserUsecase _getStoredUserUsecase;
  late GetStoredTokenUsecase _getStoredTokenUsecase;
  late LogoutUsecase _logoutUsecase;

  AppStatus status = AppStatus.unknown;
  User? user = User.empty;
  String? token;

  @override
  void onInit() async {
    super.onInit();

    _getStoredUserUsecase = GetStoredUserUsecase(authRepository);
    _getStoredTokenUsecase = GetStoredTokenUsecase(authRepository);
    _logoutUsecase = LogoutUsecase(authRepository);

    User? storedUser = _getStoredUserUsecase.call(NoParams());
    token = _getStoredTokenUsecase.call(NoParams());

    if (storedUser == null || storedUser == User.empty) {
      status = AppStatus.unauthenticated;
    } else {
      user = storedUser;
      status = AppStatus.authenticated;
    }
  }

  void reload() {
    user = _getStoredUserUsecase.call(NoParams());
    token = _getStoredTokenUsecase.call(NoParams());
    update();
  }

  void logout() async {
    unawaited(_logoutUsecase(NoParams()));
    Get.toNamed("/auth");
  }
}
