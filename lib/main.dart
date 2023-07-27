import 'package:app/src/module/auth/auth_module.dart';
import 'package:flutter/material.dart';

import 'package:app/src/shared/app/app.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

// import 'src/shared/routes/routes.dart';

void main() async {
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xff000000),
    ),
  );

  AuthRepository authRepository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());
  // IRepository = Repository(RemoteDataSource(), LocalDataSource());
  // IRepository = Repository(RemoteDataSource(), LocalDataSource());
  // IRepository = Repository(RemoteDataSource(), LocalDataSource());

  runApp(
    App(
      authRepository: authRepository,
    ),
  );
}
