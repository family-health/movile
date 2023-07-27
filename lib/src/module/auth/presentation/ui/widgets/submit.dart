import 'package:flutter/material.dart';

class Submit extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const Submit({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
    );
  }
}