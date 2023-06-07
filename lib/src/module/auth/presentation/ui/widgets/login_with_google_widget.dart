import 'package:flutter/material.dart';

class LoginWithGoogle extends StatelessWidget {
  final void Function()? onPressed;
  const LoginWithGoogle({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
      return ElevatedButton.icon(
      icon: Image.asset("assets/images/auth/google.png", width: 40, height: 40),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
      ),
      label: const Text("Sign in with google"),
    );
  }
}