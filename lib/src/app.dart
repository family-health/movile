
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/shared/utilities/environment.dart';

import 'package:app/src/module/auth/presentation/ui/screens/signin_screen.dart';
import 'package:app/src/module/auth/presentation/ui/screens/singup_screen.dart';
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
      getPages: [
        GetPage(name: Environment.ROUTE_HOME, page: () => NavigationScreen()),
        GetPage(name: Environment.ROUTE_SING_IN, page: () => const SignInScreen()),
        GetPage(name: Environment.ROUTE_SING_UP, page: () => SingnUpScreen()),
        GetPage(name: Environment.ROUTE_SETTINGS_PROFILE_INFO, page: () => SettingsProfileInfoPage()),
        GetPage(name: Environment.ROUTE_SETTINGS_PROFILE_UPDATE, page: () => SettingsProfileUpdatePage())
      ],
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle?>(const TextStyle(color: Colors.white)),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle?>(const TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}


// https://www.youtube.com/watch?v=0rZhdAutwMc&ab_channel=weincode
// https://www.youtube.com/watch?v=Ba4m4tzzbfU&ab_ckhannel=FlutterEspa%C3%B1a
// https://www.youtube.com/watch?v=Ger3Oh9qE-w&ab_channel=DevTeam504

// https://ui8.net/fancom/products/smart-home-ui-kit2?rel=timer