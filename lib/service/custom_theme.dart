import 'package:flutter/material.dart';

class CustomTheme {
  static const Color darkBgColor = Color(0xff243477);
  static const darkTextColor = Colors.white;

  static const Color lightBgColor = Colors.white;
  static const lightTextColor = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightBgColor,
    iconTheme: IconThemeData(color: Colors.black),
  );
  static final ThemeData DarkTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: darkBgColor,
    textTheme: TextTheme(bodyText2: TextStyle()),
  );

  static bool isDarkTheme(Color currentbgColor) {
    if (currentbgColor == darkBgColor) {
      return true;
    }
    return false;
  }

  isLightTheme() {}
}
