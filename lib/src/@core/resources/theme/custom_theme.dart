import 'package:app/src/@core/resources/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData theme() {
    return ThemeData(
      // fontFamily: "ArchivoBlack",
      primaryColor: Colors.black,
      colorScheme: lightColorScheme,
      // scaffoldBackgroundColor: Colors.grey.shade200,
      appBarTheme: getAppBarTheme(),
      inputDecorationTheme: getInputDecorationTheme(),
      elevatedButtonTheme: getElevatedButtonThemeData(),
      iconButtonTheme: getIconButtonThemeData(),
    );
  }

  AppBarTheme getAppBarTheme(){
    return const AppBarTheme();
  }

  InputDecorationTheme getInputDecorationTheme(){
    return const InputDecorationTheme(
        activeIndicatorBorder: BorderSide.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
      );
  }

  ElevatedButtonThemeData getElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        textStyle: MaterialStateProperty.all<TextStyle?>(
          const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  IconButtonThemeData getIconButtonThemeData() {
    return IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        textStyle: MaterialStateProperty.all<TextStyle?>(
          const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
