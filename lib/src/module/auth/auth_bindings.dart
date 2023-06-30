import 'package:app/src/module/auth/data/datasources/local/auth_get_storage_data_source_impl.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_get_data_source_impl.dart';
import 'package:app/src/module/auth/data/repositories/auth_repository.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:app/src/module/auth/presentation/logic/login_screen_controller.dart';
import 'package:app/src/module/auth/presentation/logic/register_screen_controller.dart';
import 'package:get/get.dart';
import 'package:app/src/module/auth/presentation/logic/register_form_controller.dart';
import 'package:app/src/module/auth/presentation/logic/login_form_controller.dart';

class AuthBinding extends Bindings {

  AuthRepository repository = AuthRepository(AuthGetDataSource(), AuthGetStorageDataSource());

  @override
  void dependencies() {
    //Controllers
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => LoginFormController());
    Get.lazyPut(() => RegisterFormController());

    //Usecases
    Get.lazyPut(() => LoginWithEmailUsecase(repository));
    Get.lazyPut(() => RegisterWithEmailUsecase(repository));
  }
}
