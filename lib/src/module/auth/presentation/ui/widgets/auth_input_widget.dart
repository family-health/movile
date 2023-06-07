import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  const AuthInput({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xffEFF0F2),
          icon: const Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}