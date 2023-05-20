import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:app/src/shared/utilities/environment.dart';

import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';

import 'package:app/src/app.dart';

void main() async {
  //todo: Implement dotenv
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.development");
  }

  String initialRoute = Environment.ROUTE_SING_IN;
  UserModel userSession = UserModel.fromJson(GetStorage().read(Environment.USER_STORAGE) ?? {});

  if (userSession.id != null) {
    initialRoute = Environment.ROUTE_HOME;
  }

  runApp(App(initialRoute: initialRoute));
}