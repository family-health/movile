import 'package:flutter/material.dart';

class PhoneButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  
  const PhoneButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
      return ElevatedButton.icon(
      icon: const Icon(Icons.phone,size: 40, color: Colors.white),
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