import 'package:app/src/module/auth/auth_module.dart';
import 'package:flutter/material.dart';


import 'package:app/src/shared/app/app.dart';

// import 'src/shared/routes/routes.dart';

void main() {
  // await GetStorage.init();

  // //SystemChrome is used to change bottom navigation bar colors.
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarIconBrightness: Brightness.light,
  //     systemNavigationBarColor: Color(0xpff000000),
  //   ),
  // );
  
  // //todo: Implement dotenv
  // if (kReleaseMode) {
  //   await dotenv.load(fileName: ".env.production");
  // } else {
  //   await dotenv.load(fileName: ".env.development");
  // }


  AuthRepository authRepository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());
  // IRepository = Repository(RemoteDataSource(), LocalDataSource());
  // IRepository = Repository(RemoteDataSource(), LocalDataSource());
  // IRepository = Repository(RemoteDataSource(), LocalDataSource());

  runApp(
    App(authRepository: authRepository,),
  );
}