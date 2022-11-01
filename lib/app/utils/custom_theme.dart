import 'package:flutter/material.dart';

abstract class CustomTheme {
  CustomTheme._();

  static final lightTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color.fromRGBO(82, 195, 255, 1),
      selectionColor: Color.fromRGBO(82, 195, 255, 1),
      selectionHandleColor: Color.fromRGBO(82, 195, 255, 1),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: Color.fromRGBO(82, 195, 255, 1),
    primaryColorLight: Color.fromRGBO(239, 249, 255, 1),
    primaryColorDark: Color.fromRGBO(82, 195, 255, 1),
    brightness: Brightness.light,
    dividerColor: const Color.fromARGB(255, 226, 226, 226),
    backgroundColor: Colors.grey[100],
  );
}
