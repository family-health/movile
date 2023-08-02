import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:app/src/module/auth/auth_routes.dart';
import 'package:app/src/module/common/common_bindings.dart';
import 'package:app/src/shared/app/logic/app_controller.dart';
import 'package:get/get.dart';

import 'package:app/src/shared/theme/custom_theme.dart';

import 'package:app/src/module/home/home_routes.dart';

class App extends StatelessWidget {
  final IAuthRepository authRepository;

  const App({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.put(
      AppController(authRepository),
    );

    bool authenticated = (controller.status == AppStatus.authenticated);
    return AppScreen(initialRoute: (authenticated == false) ? "/auth" : "/home");
  }
}

class AppScreen extends StatelessWidget {
  final String initialRoute;
  const AppScreen({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      theme: CustomTheme().theme(),   
      initialBinding: CommonBindings(),
      initialRoute: initialRoute,
      getPages: [...authRoutes, ...homeRoutes],
    );
  }
}