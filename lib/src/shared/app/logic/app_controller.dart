import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/module/auth/domain/usecases/get_user_usecase.dart';
import 'package:app/src/module/common/domain/usecases/usecases.dart';
import 'package:get/get.dart';

enum AppStatus { unknown, authenticated, unauthenticated }

class AppController extends GetxController {
  final GetUserUsecase getAuthUserUsecase;
  final LogoutUsecase logoutUsecase;

  AppController({required this.getAuthUserUsecase, required this.logoutUsecase});

  AppStatus status = AppStatus.unknown;

  @override
  void onInit() {
    super.onInit();
    _getCurrentUser();
  }


  User? _getCurrentUser(){
    User? user = getAuthUserUsecase.call(NoParams());

    if(user == null){
      status = AppStatus.unauthenticated;
    }else {
      status = AppStatus.authenticated;
    }

    return null;
  }

  void _logout() async {
    await logoutUsecase.call(NoParams());
  }
}