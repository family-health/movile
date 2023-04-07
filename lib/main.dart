import 'package:app/src/environment/environment.dart';
import 'package:app/src/pages/home/home_page.dart';

import 'src/pages/auth/singIn/singin_page.dart';
import 'src/pages/auth/singUp/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
//screens
// import 'package:app/features/tabulator/screens/tabulator_screen.dart';
// import 'package:app/features/auth/screens/singnin_screen.dart';

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
    GetStorage box = GetStorage();
    String token = box.read('token') ?? "";

    return GetMaterialApp(
      title: 'Family Health',
      debugShowCheckedModeBanner: false,
      initialRoute:
          (token != "") ? Environment.ROUTE_HOME : Environment.ROUTE_SING_IN,
      // home: const ProfileScreen(),
      getPages: [
        GetPage(name: Environment.ROUTE_HOME, page: () => HomePage()),
        GetPage(name: Environment.ROUTE_SING_IN, page: () => SingnInScreen()),
        GetPage(name: Environment.ROUTE_SING_UP, page: () => SingnUpScreen()),
      ],
    );
  }
}
