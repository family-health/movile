import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  final Color _colorText = Colors.white;
  final Color _backgroundColor = Colors.black;
  final Color _iconColor = Colors.white;

  void error(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: _colorText,
      backgroundColor: _backgroundColor,
      icon: Icon(Icons.add_alert, color: _iconColor),
    );
  }

  void warning(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: _colorText,
      backgroundColor: _backgroundColor,
      icon: Icon(Icons.warning_amber_outlined, color: _iconColor),
    );
  }

  void success(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: _colorText,
      backgroundColor: _backgroundColor,
      icon: Icon(Icons.check, color: _iconColor),
    );
  }
}