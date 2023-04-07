// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:app/src/screens/auth/singIn/singInController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app/src/widgets/all.dart' as widgets;

class SingnInScreen extends StatelessWidget {
  final SingInController _con = Get.put(SingInController());

  SingnInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildNavigationBar(context),
        body: Column(children:  [
          const widgets.HeaderImage(assetName: "assets/images/auth/login.png"),
          Expanded(child: const widgets.SingnInForm()),
        ]),
      ),
    );
  }

  Widget buildNavigationBar(BuildContext context) {
    TextSpan hereText = TextSpan(
      text: 'here',
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      recognizer: TapGestureRecognizer()
        ..onTap = () => _con.pushSingUpScreen(context),
    );

    RichText richText = RichText(
      text: TextSpan(
        text: 'You are new? create an account ',
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[hereText],
      ),
    );

    return Container(
      color: Colors.white70,
      height: 110.0,
      child: Center(child: richText),
    );
  }
}
