import 'package:flutter/material.dart';

class SnackbarUtil {
  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.blue,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
