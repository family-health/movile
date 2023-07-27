import 'package:app/src/shared/app/logic/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: logout,
          child: const Text("Logout Test")),
      ),
    );
  }

  void logout(){
    AppController appController = Get.find<AppController>();
    appController.logout();
  }
}