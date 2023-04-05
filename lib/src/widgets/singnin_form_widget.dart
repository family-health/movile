import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/auth/singUp/singUpController.dart';
import 'package:app/src/widgets/input_widget.dart';

class SingnInForm extends StatelessWidget {
  const SingnInForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SingUpController());
    SingUpController controller = Get.find();

    return Container(
      color: Colors.white70,
      padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildFormTitle(),
          Input(
            controller: controller.usernameTextEditingController,
            hintText: "Username",
            obscureText: false,
          ),
          Input(
            controller: controller.passwordTextEditingController,
            hintText: "Password",
            obscureText: true,
          ),
          const SizedBox(height: 15.0),
          Center(child: buildFormSubmit()),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Center(child: Text("Or Singn in with")),
          ),
          Center(child: buildSingnInWithGoogle()),
        ],
      ),
    );
  }

  Widget buildFormTitle() {
    TextStyle style =
        const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
    return Text("Login", style: style);
  }

  Widget buildFormSubmit() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        minimumSize: const Size.fromHeight(50),
      ),
      child: const Text("Singn In"),
    );
  }

  Widget buildSingnInWithGoogle() {
    return ElevatedButton.icon(
      icon: Image.asset("assets/images/auth/google.png", width: 40, height: 40),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
      ),
      label: const Text("Sign in with google",
          style: TextStyle(color: Colors.black)),
    );
  }

  void onPressed() {
    SingUpController controller = Get.find();
    controller.signIn();
  }
}
