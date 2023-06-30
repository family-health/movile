import 'package:app/src/@core/enums/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app/src/module/auth/data/models/user_model_old.dart';

import 'package:app/src/app.dart';

void main() async {
  
  //todo: Implement dotenv
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.development");
  }

  String initialRoute = ROUTES.ROUTE_SING_IN;
  UserModel userSession = UserModel.fromJson(GetStorage().read(STORAGE().toString()) ?? {});

  if (userSession.id != null) {
    initialRoute = ROUTES.ROUTE_HOME;
  }

  runApp(App(initialRoute: initialRoute));
}