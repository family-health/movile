import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:app/src/shared/app/app.dart';
import 'package:get_storage/get_storage.dart';

import 'src/shared/routes/routes.dart';

void main() async {
  await GetStorage.init();

  //SystemChrome is used to change bottom navigation bar colors.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xff000000),
    ),
  );
  
  //todo: Implement dotenv
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.development");
  }

  //Check initial route.
  String initialRoute = Routes.auth;
  // AuthLocalDataSource authGetStorageDataSource = AuthLocalDataSource();
  // Map<String,dynamic>? loggedInUser = authGetStorageDataSource.readUser();

  // if (loggedInUser != null) {
  //   initialRoute = ROUTES.ROUTE_HOME;
  // }

  runApp(App(initialRoute: initialRoute));
}