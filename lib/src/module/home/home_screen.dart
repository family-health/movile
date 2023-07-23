import 'package:app/src/module/auth/auth_module.dart';
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
    Get.toNamed("/auth");
    AuthLocalDataSource().removeUser();
  }
}