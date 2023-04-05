// ignore_for_file: file_names

import 'package:app/src/widgets/singnup_form_widget.dart';
import 'package:app/src/widgets/header_image_widget.dart';
import 'package:flutter/material.dart';

class SingnUpScreen extends StatelessWidget {
  const SingnUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: const [
          HeaderImage(assetName: "assets/images/auth/register.png"),
          Expanded(child: SingUpForm()),
        ]),
      ),
    );
  }
}
