import 'package:flutter/material.dart';

class AppColors {
  static const bg = Color.fromARGB(255, 222, 227, 229);
  static Color snackThemeColor(BuildContext context){
    return  Theme.of(context).brightness == Brightness.light
      ? const Color.fromARGB(105, 0, 0, 0)
      : const Color.fromARGB(154, 255, 255, 255);
  }
  static Color ThemeDasrkWhite(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
      ? Colors.white
      : const Color.fromARGB(255, 0, 0, 0);
       static Color ThemeWhiteDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
      ? Colors.black
      : Colors.white;
  static const white = Colors.white;
  static const black = Colors.black;
  static const ltOrange = Color.fromARGB(255, 255, 240, 235);
  static const red = Colors.red;
  static const onTrak = Colors.green;
}
