import 'package:flutter/material.dart';


class ColorScreen extends StatelessWidget {
  final Color color;

  const ColorScreen({Key? key,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: color);
  }
}
