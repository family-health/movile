// import 'package:app/src/shared/presentation/logic/stepper_controller.dart';
import 'package:get/get.dart';

// import 'package:app/src/shared/presentation/logic/app_controller.dart';

class SharedBindings extends Bindings {
  // AuthRepository authRepository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());

  @override
  void dependencies() {
    // Get.lazyPut(() => AppController(authRepository));
  }
}