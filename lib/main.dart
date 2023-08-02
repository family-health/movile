import 'package:app/src/module/auth/data/datasources/local/auth_local_data_source_impl.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_get_data_source_impl.dart';
import 'package:app/src/module/auth/data/repositories/auth_repository.dart';
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