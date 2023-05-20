
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/shared/utilities/environment.dart';

import 'package:app/src/module/auth/presentation/views/screens/singin_screen.dart';
import 'package:app/src/module/auth/presentation/views/screens/singup_screen.dart';
import 'package:app/src/module/navigation/ui/screens/navigation_screen.dart';
import 'package:app/src/module/profile/ui/screens/profile_screen.dart';
import 'package:app/src/module/profile/ui/screens/profile_update_screen.dart';


class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: Environment.ROUTE_HOME, page: () => NavigationScreen()),
        GetPage(name: Environment.ROUTE_SING_IN, page: () => SingnInScreen()),
        GetPage(name: Environment.ROUTE_SING_UP, page: () => SingnUpScreen()),
        GetPage(name: Environment.ROUTE_SETTINGS_PROFILE_INFO, page: () => SettingsProfileInfoPage()),
        GetPage(name: Environment.ROUTE_SETTINGS_PROFILE_UPDATE, page: () => SettingsProfileUpdatePage())
      ]
    );
  }
}


// https://www.youtube.com/watch?v=0rZhdAutwMc&ab_channel=weincode
// https://www.youtube.com/watch?v=Ba4m4tzzbfU&ab_ckhannel=FlutterEspa%C3%B1a
// https://www.youtube.com/watch?v=Ger3Oh9qE-w&ab_channel=DevTeam504