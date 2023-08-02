import 'package:app/src/module/auth/presentation/logic/auth_router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthScreen extends GetView<AuthRouterController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const TextStyle titleStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);

    ButtonStyle blackButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.black,
      minimumSize: const Size(500.0, 60.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      side: const BorderSide(color: Colors.black, width: 1.0),
      textStyle: const TextStyle(color: Colors.white),
    );
    ButtonStyle whiteButtonStyle = TextButton.styleFrom(
      minimumSize: const Size(500.0, 60.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      side: const BorderSide(color: Colors.black, width: 1.0),
      textStyle: const TextStyle(color: Colors.black),
    );

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Image.asset("assets/images/auth/auth-doctors.png"),
              ]),
              const Column(children: [
                Text("Health Tracker", style: titleStyle),
                SizedBox(height: 10.0),
                Text(
                  "Share and track your health data with your doctors, friends, family and whoever",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                )
              ]),
              Column(children: [
                OutlinedButton(
                  onPressed: controller.navigateToLoginScreen,
                  style: blackButtonStyle,
                  child: const Text("Sign In", style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 10.0),
                OutlinedButton(
                  onPressed: controller.navigateToRegisterScreen,
                  style: whiteButtonStyle,
                  child: const Text("Create account"),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  } 
}