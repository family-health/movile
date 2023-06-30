
import 'package:app/src/@core/theme/custom_theme.dart';
import 'package:app/src/@core/enums/enum.dart';
import 'package:app/src/module/auth/auth_routes.dart';
import 'package:app/src/shared/shared_bindings.dart';
// import 'package:app/src/shared/presentation/ui/stepper_example.dart';
// import 'package:app/src/shared/presentation/ui/stepper_example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/navigation/ui/screens/navigation_screen.dart';
import 'package:app/src/module/profile/ui/screens/profile_screen.dart';
import 'package:app/src/module/profile/ui/screens/profile_update_screen.dart';


class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      // initialRoute: "/auth",
      // home: const StepperExample(),
      defaultTransition: Transition.noTransition,
      theme: CustomTheme().theme(),
      initialBinding: SharedBindings(),
      getPages: [
        ...authRoutes,
        GetPage(name: ROUTES.ROUTE_HOME, page: () => NavigationScreen()),
        GetPage(name: ROUTES.ROUTE_SETTINGS_PROFILE_INFO, page: () => SettingsProfileInfoPage()),
        GetPage(name: ROUTES.ROUTE_SETTINGS_PROFILE_UPDATE, page: () => SettingsProfileUpdatePage())
      ],
    );
  }
}


// https://www.youtube.com/watch?v=0rZhdAutwMc&ab_channel=weincode
// https://www.youtube.com/watch?v=Ba4m4tzzbfU&ab_ckhannel=FlutterEspa%C3%B1a
// https://www.youtube.com/watch?v=Ger3Oh9qE-w&ab_channel=DevTeam504

// https://ui8.net/fancom/products/smart-home-ui-kit2?rel=timer

// https://www.youtube.com/watch?v=ZNMz2hOrddo&list=PLCAZyR6zw2pznlDPLCMUGUVr7uFRlMpTs&ab_channel=MaxonFlutter