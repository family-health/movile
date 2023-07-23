import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/shared/theme/custom_theme.dart';
import 'package:app/src/module/common/shared_bindings.dart';

import 'package:app/src/module/auth/auth_routes.dart';
import 'package:app/src/module/home/home_routes.dart';

class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      theme: CustomTheme().theme(),
      navigatorObservers: const [],
      initialBinding: SharedBindings(),
      initialRoute: initialRoute,
      // initialRoute: "/auth",
      getPages: [
        ...authRoutes,
        ...homeRoutes
      ],
    );
  }
}