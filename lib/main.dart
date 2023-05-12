import 'package:app/src/@core/enviroments/environment.dart';
import 'package:app/src/@core/themes/light_theme.dart';
import 'package:app/src/feature/auth/data/models/user_model.dart';
import 'package:app/src/feature/navigation/ui/screens/navigation_screen.dart';
import 'package:app/src/feature/profile/ui/screens/profile_screen.dart';
import 'package:app/src/feature/profile/ui/screens/profile_update_screen.dart';

import 'src/feature/auth/ui/screens/singin_screen.dart';
import 'src/feature/auth/ui/screens/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
//screens
// import 'package:app/features/tabulator/screens/tabulator_screen.dart';
// import 'package:app/features/auth/screens/singnin_screen.dart';

UserModel userSession = UserModel.fromJson(GetStorage().read(Environment.USER_STORAGE) ?? {});

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.white,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
  // await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Family Health',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null
          ? Environment.ROUTE_HOME
          : Environment.ROUTE_SING_IN,
      getPages: [
        GetPage(name: Environment.ROUTE_HOME, page: () => NavigationScreen()),
        GetPage(name: Environment.ROUTE_SING_IN, page: () => SingnInScreen()),
        GetPage(name: Environment.ROUTE_SING_UP, page: () => SingnUpScreen()),
        GetPage(name: Environment.ROUTE_SETTINGS_PROFILE_INFO, page: () => SettingsProfileInfoPage()),
        GetPage(name: Environment.ROUTE_SETTINGS_PROFILE_UPDATE, page: () => SettingsProfileUpdatePage()),
      ],
    );
  }
}
