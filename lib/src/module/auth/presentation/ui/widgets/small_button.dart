import 'package:flutter/material.dart';

///[SmallButton] widget use

class SmallButton extends StatelessWidget {
  final String image;
  final Function()? onPressed;
  const SmallButton({super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: getButtonStyle(),
      child: Image.asset(image, color: Colors.black, height: 25.0, width: 25.0),
    );
  }

  ButtonStyle getButtonStyle() {
    return TextButton.styleFrom(
      backgroundColor: Colors.white,
      side: const BorderSide(color: Colors.black, width: 1.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      textStyle: const TextStyle(color: Colors.white),
    );
  }
}
