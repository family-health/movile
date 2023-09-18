import 'package:app/src/module/health/data/datasources/local/health_local_data_source_impl.dart';
import 'package:app/src/shared/presentation/logic/workmanager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/health/data/datasources/health/health_data_source_impl.dart';
import 'package:app/src/module/health/data/datasources/remote/health_remote_data_source_impl.dart';
import 'package:app/src/module/health/data/repositories/heart_rate_repository_impl.dart';
import 'package:app/src/module/health/domain/usecases/get_heart_rate_data_usecase.dart';
import 'package:app/src/module/home/home_routes.dart';
import 'package:app/src/module/main/main_routes.dart';
import 'package:app/src/shared/presentation/logic/network_controller.dart';

import 'package:app/src/@core/resources/theme/custom_theme.dart';
import 'package:app/src/shared/shared_bindings.dart';

import 'shared/presentation/logic/app_controller.dart';

class App extends StatelessWidget {
  final IAuthRepository authRepository;

  const App({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.put(AppController(authRepository));

    bool authenticated = (controller.status == AppStatus.authenticated);
    String? initialRoute = (authenticated == false) ? "/auth" : "/main";

    Get.put(AppController(authRepository));
    Get.put(NetworkController());
    Get.put(WorkmanagerController());

    //Usecases
    Get.put(GetHeartRateDataUsecase(
      HeartRateRepository(
        health: HealthDataSource(),
        local: HealthLocalDataSource(),
        remote: HealthRemoteDataSource(),
      ),
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      theme: CustomTheme().theme(),
      initialBinding: SharedBindings(),
      initialRoute: initialRoute,
      getPages: [
        ...mainRoutes,
        ...authRoutes,
        ...homeRoutes,
      ],
    );
  }
}
