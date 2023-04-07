import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const Input(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
