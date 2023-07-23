import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const FormHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_Title(title), _Subtitle(subtitle)],
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  const _Title(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: getTextStyle());
  }

  TextStyle getTextStyle(){
    return const TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.w600
    );
  }
}

class _Subtitle extends StatelessWidget {
  final String text;
  const _Subtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: getTextStyle());
  }

    TextStyle getTextStyle(){
    return const TextStyle(
      color: Colors.black54,
      fontSize: 15.0,
      fontWeight: FontWeight.normal
    );
  }
}