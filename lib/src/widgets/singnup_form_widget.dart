import '../screens/auth/singUp/singUpController.dart';
import 'package:app/src/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingUpController con = Get.put(SingUpController());

    return Container(
      color: Colors.white70,
      padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
      child: Form(
        key: con.singnInFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildFormTitle(),
            Input(
                controller: con.nameTextEditingController,
                hintText: "Name",
                obscureText: false),
            Input(
                controller: con.usernameTextEditingController,
                hintText: "Username",
                obscureText: false),
            Input(
                controller: con.passwordTextEditingController,
                hintText: "Password",
                obscureText: true),
            const SizedBox(height: 15.0),
            buildFormSubmit(),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Center(child: Text("Or Singn up with")),
            ),
            buildSingnUpWithGoogle(),
          ],
        ),
      ),
    );
  }

  // Build functions
  //? [buildFormTitle] : Build title of form
  //? [buildFormSubmit] : Build Singn Up button
  //? [buildFormSubmit] : Build Singn Up button

  Widget buildFormTitle() {
    TextStyle style =
        const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
    return Text("Register", style: style);
  }

  Widget buildFormSubmit() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        minimumSize: const Size.fromHeight(50),
      ),
      child: const Text("Singn Up"),
    );
  }

  Widget buildSingnUpWithGoogle() {
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

  // Gesture functions
  //? [onPressed] :  When press call signUp function inside [AuthController]

  void onPressed() {
    SingUpController controller = Get.find();
    controller.signUp();
  }
}
