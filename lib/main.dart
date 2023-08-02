import 'package:app/src/module/auth/auth_module.dart';
import 'package:flutter/material.dart';

import 'package:app/src/shared/app/app.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

// import 'src/shared/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarIconBrightness: Brightness.light, systemNavigationBarColor: Color(0xff000000)),
  );

  await GetStorage.init();
  await dotenv.load();

  AuthRepository authRepository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());

  runApp(App(authRepository: authRepository));
}