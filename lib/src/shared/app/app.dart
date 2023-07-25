import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/domain/usecases/get_stored_user_usecase.dart';
import 'package:app/src/shared/app/logic/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/shared/theme/custom_theme.dart';

import 'package:app/src/module/home/home_routes.dart';

class App extends StatelessWidget {
  final IAuthRepository authRepository;

  const App({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.put(
      AppController(
        getAuthUserUsecase: GetStoredUserUsecase(authRepository),
        logoutUsecase: LogoutUsecase(authRepository),
      ),
    );

    bool authenticated = (controller.status == AppStatus.authenticated);
    return AppScreen(initialRoute: (authenticated) ? "/auth" : "/home");
  }
}

class AppScreen extends StatelessWidget {
  final String initialRoute;
  const AppScreen({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // defaultTransition: Transition.noTransition,
      theme: CustomTheme().theme(),
      navigatorObservers: const [],
      
      // initialBinding: SharedBindings(),
      // initialRoute: initialRoute,
      // getPages: [...authRoutes, ...homeRoutes],
      // home: ,
      home: const HomeScreen(),
    );
  }
}