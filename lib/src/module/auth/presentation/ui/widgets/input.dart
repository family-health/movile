import 'package:flutter/material.dart';

/// [Input] class is used to get TextField values in singIn and singUp forms.
/// ? [controller] is usted to link controllers of Getx controllers in diferents forms controllers.
/// ? [hintText] is used to set in InputDecoration inside function [getInputDecoration()].
/// ? [obscureText] is used to show sufixIcon inside inputDecoration, only compare [obscureText] the first time comes of widget.obscureText to determine
/// ? if the input is password or text field, later we use the late [obscureText] to change the sufixIcon and obscureText inside [TextField] .

class Input extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  const Input({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late bool obscureText;
  
  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: widget.controller,
        obscureText: obscureText,
        decoration: getInputDecoration(),
      ),
    );
  }

  InputDecoration getInputDecoration(){
      Widget sufixIcon = IconButton(
        onPressed: toggleSufixIcon,
        icon: Icon((obscureText == true) ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
      );

    InputDecoration inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(20.0),
      border: const OutlineInputBorder(),
      hintText: widget.hintText,
      filled: true,
      fillColor: const Color(0xffEFF0F2),
    );

    if (widget.obscureText == false) {
      return inputDecoration;
    }else {
      return inputDecoration.copyWith(suffixIcon: sufixIcon);
    }

  }

  void toggleSufixIcon(){
    obscureText = !obscureText;
    setState(() {});
  }
}