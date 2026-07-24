import 'package:flutter/material.dart';

class AppTheme {
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
  static const color = Color.fromARGB(255, 255, 107, 9);
  static const Color textHint = Color(0xFFADB5BD);
  static const colors = Color.fromARGB(255, 255, 255, 255);
  static const Color error = Color(0xFFDC3545);
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
