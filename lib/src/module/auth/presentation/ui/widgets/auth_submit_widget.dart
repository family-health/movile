import 'package:flutter/material.dart';

class AuthSubmit extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const AuthSubmit({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(label),
    );
  }
}