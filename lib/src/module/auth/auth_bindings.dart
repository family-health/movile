import 'package:get/get.dart';

import 'data/repositories/auth_repository.dart';
import 'data/datasources/local/auth_local_data_source_impl.dart';
import 'data/datasources/remote/auth_get_data_source_impl.dart';

import 'domain/usecases/login_with_email_usecase.dart';
import 'domain/usecases/register_with_email_usecase.dart';

import 'presentation/logic/auth_router_controller.dart';
import 'presentation/logic/login_apple_controller.dart';
import 'presentation/logic/login_email_controller.dart';
import 'presentation/logic/login_facebook_controller.dart';
import 'presentation/logic/login_google_controller.dart';
import 'presentation/logic/login_router_controller.dart';
import 'presentation/logic/register_router_controller.dart';

AuthRepository repository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRouterController());
  }
}

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRouterController());
    Get.lazyPut(() => LoginEmailController());
    Get.lazyPut(() => LoginFacebookController());
    Get.lazyPut(() => LoginGoogleController());
    Get.lazyPut(() => LoginAppleController());
    Get.lazyPut(() => LoginWithEmailUsecase(repository));
  }
}

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterRouterController());
    Get.lazyPut(() => RegisterWithEmailUsecase(repository));
  }
}