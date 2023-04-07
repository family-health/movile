// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/screens/auth/singIn/singInController.dart';
import 'package:app/src/widgets/input_widget.dart';
import 'package:app/src/widgets/header_image_widget.dart';

class SingnInScreen extends StatelessWidget {
  SingnInScreen({Key? key}) : super(key: key);
  final SingInController _con = Get.put(SingInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SizedBox(height: 70, child: _textDontHaveAcount()),
        body: Column(children: [
          const HeaderImage(
            assetName: "assets/images/auth/login.png",
            height: 100,
            width: double.infinity,
          ),
          Expanded(child: _content()),
        ]),
      ),
    );
  }

  Widget _content() {
    return Container(
      color: Colors.white70,
      padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _textLogin(),
          Input(
            controller: _con.emailTextEditingController,
            hintText: "Email",
            obscureText: false,
          ),
          Input(
            controller: _con.passwordTextEditingController,
            hintText: "Password",
            obscureText: true,
          ),
          const SizedBox(height: 15.0),
          Center(child: buildFormSubmit()),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Center(child: Text("Or Singn in with")),
          ),
          // Center(child: buildSingnInWithGoogle()),
        ],
      ),
    );
  }

  Widget _textLogin() {
    TextStyle style =
        const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
    return Container(
        margin: EdgeInsets.only(top: 30), child: Text("Login", style: style));
  }

  Widget _textDontHaveAcount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "No tengo una cuenta",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () => _con.goToRegisterPage(),
          child: const Text(
            "Registrate aquí",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        )
      ],
    );
  }

  Widget buildFormSubmit() {
    return ElevatedButton(
      onPressed: () {},
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
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
      ),
      label: const Text("Sign in with google",
          style: TextStyle(color: Colors.black)),
    );
  }
}
