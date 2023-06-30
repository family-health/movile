import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
        const Expanded(
          child: Divider(
            height: 45.0,
            color: Colors.grey,
            thickness: 1,
            indent: 20.0,
            endIndent: 10.0,
          ),
        ),
        Text(text),
        const Expanded(
          child: Divider(
            height: 45.0,
            color: Colors.grey,
            thickness: 1,
            indent: 20.0,
            endIndent: 10.0,
          ),
        ),
    ],);
  }
}