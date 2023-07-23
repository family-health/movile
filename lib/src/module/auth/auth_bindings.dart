import 'package:get/get.dart';

//Datasources
import 'package:app/src/module/auth/data/datasources/local/auth_storage_data_source_impl.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_get_data_source_impl.dart';

//UseCases
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';

//Controllers
import 'package:app/src/module/auth/presentation/logic/login_controller.dart';
import 'package:app/src/module/auth/presentation/logic/register_screen_controller.dart';
import 'package:app/src/module/auth/presentation/logic/register_form_controller.dart';

//Repositories
import 'package:app/src/module/auth/data/repositories/auth_repository.dart';

class AuthBinding extends Bindings {

  AuthRepository repository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());

  @override
  void dependencies() {
    //Controllers
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => LoginNavigationController());
    Get.lazyPut(() => LoginEmailController());
    Get.lazyPut(() => LoginFacebookController());
    Get.lazyPut(() => LoginGoogleController());
    Get.lazyPut(() => LoginAppleController());
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => RegisterFormController());

    //Usecases
    Get.lazyPut(() => LoginWithEmailUsecase(repository));
    Get.lazyPut(() => RegisterWithEmailUsecase(repository));
  }
}