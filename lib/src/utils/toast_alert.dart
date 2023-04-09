import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alertas {
  static void warning(String mensaje) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.yellow[600],
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void error(String mensaje) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[600],
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void success(String mensaje) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[600],
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
