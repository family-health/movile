import 'package:app/src/module/auth/presentation/ui/widgets/input_widget.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/auth_submit_widget.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/forgot_password.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/login_with_google_widget.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AuthInput(controller: null, hintText: "example@domain.com", obscureText: false),
          const AuthInput(controller: null, hintText: "************", obscureText: true),
          const Align(alignment: Alignment.centerRight,child: ForgotPassword()),
          const SizedBox(height: 20.0),
          AuthSubmit(onPressed: login, label: "Login"),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Center(child: Text("Or Singn in with")),
          ),
          LoginWithGoogle(onPressed: login),
      ],),
    );
  }

  void login(){
    // ignore: avoid_print
    print("Login!");
  }
}