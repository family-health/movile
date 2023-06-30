// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class BottomText extends StatelessWidget {
  final String text;
  final String span;
  final Function()? onTap;
  const BottomText({super.key, required this.text, required this.span, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: Center(child: buildRichText()),
    );
  }

  Widget buildRichText(){
    TextSpan textSpan = TextSpan(
      text: span,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );

    return RichText(
      text: TextSpan(
        text: '$text ',
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[textSpan],
      ),
    );
  }

}