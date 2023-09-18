// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LayoutBottom extends StatelessWidget {
  final String text;
  final String span;
  final Function()? onTap;
  const LayoutBottom({super.key, required this.text, required this.span, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 50.0,
      child: Center(child: buildRichText()),
    );
  }

  Widget buildRichText(){
    TextSpan textSpan = TextSpan(
      text: span,
      style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );

    return RichText(
      text: TextSpan(
        text: '$text ',
        style: const TextStyle(color: Colors.white, fontSize: 15.0),
        children: <TextSpan>[textSpan],
      ),
    );
  }

}