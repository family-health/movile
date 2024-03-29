import 'package:flutter/material.dart';

class SecureOption extends StatelessWidget {
  final String text;
  final String assetPath;
  const SecureOption({super.key, required this.text, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(AssetImage(assetPath),size: 40.0),
          const SizedBox(height: 3.0),
          Text(text),
        ],
      ),
    );
  }
}