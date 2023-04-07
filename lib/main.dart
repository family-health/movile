import 'package:app/src/environment/environment.dart';

import 'src/pages/auth/singIn/singInScreen.dart';
import 'src/pages/auth/singUp/singUpScreen.dart';
import 'src/pages/tabulador/tabuladorScreen.dart';
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
      initialRoute: (token != "") ? "/tabulator" : "/auth/signin",
      // home: const ProfileScreen(),
      getPages: [
        GetPage(name: '/tabulator', page: () => TabulatorScreen()),
        GetPage(name: Environment.ROUTE_SING_IN, page: () => SingnInScreen()),
        GetPage(name: Environment.ROUTE_SING_UP, page: () => SingnUpScreen()),
      ],
    );
  }
}
