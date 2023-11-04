import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff1A1A1A);
  static Color yellowColor = Color(0xffFFBB3B);
  static Color blackColor = Color(0xff121312);
  static Color whiteColor = Color(0xffffffff);
  static Color grayColor = Color(0xffB5B4B4);
  static Color cardGrayColor = Color(0xff343534);
  static Color graybg = Color(0xff282A28);
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLight,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: primaryLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor, unselectedItemColor: whiteColor),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: whiteColor),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: whiteColor),
      bodySmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: grayColor),
    ),
  );
}
