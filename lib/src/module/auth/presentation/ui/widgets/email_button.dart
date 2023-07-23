import 'package:flutter/material.dart';

class EmailButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  
  const EmailButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
      return ElevatedButton.icon(
      icon: const Icon(Icons.email,size: 40, color: Colors.white),
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