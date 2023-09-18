// ignore_for_file: avoid_print

import 'dart:async';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController extends GetxController {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    super.onInit();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi || result == ConnectivityResult.vpn) {
        print("connected to internet");
      } else if (result == ConnectivityResult.none){
        print("without internet connection");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }
}
