// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: Center(child: buildRichText()),
    );
  }

  Widget buildRichText(){
    TextSpan hereTextSpan = TextSpan(
      text: 'here',
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      recognizer: TapGestureRecognizer()..onTap = () => print("push signup screen"),
    );

    return RichText(
      text: TextSpan(
        text: 'You are new? create an account ',
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[hereTextSpan],
      ),
    );
  }
}