import 'package:app/src/config/themes/app_theme.dart';
import 'package:app/src/enum/enum.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/pages/settings/profile/info/settings_profile_info_page.dart';
import 'package:app/src/pages/settings/profile/update/settings_profile_update_page.dart';
import 'package:app/src/pages/family/edit/family_edit_page.dart';

import 'src/pages/auth/singIn/singin_page.dart';
import 'src/pages/auth/singUp/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'src/pages/family/list_families/family_list_families_page.dart';

User userSession =
    User.fromJson(GetStorage().read(STORAGE.USER_STORAGE) ?? {});

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
      theme: AppTheme(selectedColor: 1).theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null
          ? ROUTES.ROUTE_HOME
          : ROUTES.ROUTE_SING_IN,
      getPages: [
        GetPage(name: ROUTES.ROUTE_HOME, page: () => HomePage()),
        GetPage(name: ROUTES.ROUTE_SING_IN, page: () => SingnInPage()),
        GetPage(name: ROUTES.ROUTE_SING_UP, page: () => SingnUpPage()),
        GetPage(
            name: ROUTES.ROUTE_SETTINGS_PROFILE_INFO,
            page: () => SettingsProfileInfoPage()),
        GetPage(
            name: ROUTES.ROUTE_SETTINGS_PROFILE_UPDATE,
            page: () => SettingsProfileUpdatePage()),
        GetPage(
            name: ROUTES.ROUTE_FAMILY_LIST_FAMILIES,
            page: () => FamilyCreateListFamiliesPage()),
        GetPage(
            name: ROUTES.ROUTE_FAMILY_EDIT, page: () => FamilyEditPage()),
      ],
    );
  }
}
