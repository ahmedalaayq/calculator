import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: Color(0xFF16171C),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF16171C),
      foregroundColor: Colors.white,
    ),
    cardColor: Color(0xFF452829),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Color(0xFFE8D1C5),
  );

  // ThemeMode

  static bool get isDark => themeNotifier.value == ThemeMode.dark;
}
