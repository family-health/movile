// ignore_for_file: avoid_print
import 'dart:async';

import 'package:app/src/@core/utilities/tasks.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:app/src/shared/presentation/logic/workmanager_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import 'package:app/src/app.dart';
import 'package:workmanager/workmanager.dart';

Completer uploadCompleter = Completer();

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    if (taskName == Tasks.uploadHealthDataPointsTask) await UploadHealthDataTask.call(inputData);
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarIconBrightness: Brightness.light, systemNavigationBarColor: Color(0xff000000)),
  );

  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  await GetStorage.init();
  await dotenv.load();

  AuthRepository authRepository = AuthRepository(AuthGetDataSource(), AuthLocalDataSource());

  runApp(App(authRepository: authRepository));
}