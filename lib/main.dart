import 'package:app/src/environment/environment.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/pages/settings/profile/info/settings_profile_info_page.dart';
import 'package:app/src/pages/settings/profile/update/settings_profile_update_page.dart';

import 'src/pages/auth/singIn/singin_page.dart';
import 'src/pages/auth/singUp/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
//screens
// import 'package:app/features/tabulator/screens/tabulator_screen.dart';
// import 'package:app/features/auth/screens/singnin_screen.dart';

User userSession =
    User.fromJson(GetStorage().read(Environment.USER_STORAGE) ?? {});

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.white,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
  // await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Family Health',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null
          ? Environment.ROUTE_HOME
          : Environment.ROUTE_SING_IN,
      getPages: [
        GetPage(name: Environment.ROUTE_HOME, page: () => HomePage()),
        GetPage(name: Environment.ROUTE_SING_IN, page: () => SingnInPage()),
        GetPage(name: Environment.ROUTE_SING_UP, page: () => SingnUpPage()),
        GetPage(
            name: Environment.ROUTE_SETTINGS_PROFILE_INFO,
            page: () => SettingsProfileInfoPage()),
        GetPage(
            name: Environment.ROUTE_SETTINGS_PROFILE_UPDATE,
            page: () => SettingsProfileUpdatePage()),
      ],
    );
  }
}
