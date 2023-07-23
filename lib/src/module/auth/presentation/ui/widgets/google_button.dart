import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  
  const GoogleButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
      return ElevatedButton.icon(
      icon: Image.asset("assets/images/auth/google-white.png", width: 40, height: 40),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        backgroundColor: Colors.black,
        minimumSize: const Size.fromHeight(50),
      ),
      label: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
  
}