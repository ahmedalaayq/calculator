import 'package:calculator/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'screens/calc_screen.dart';

void main() {
  runApp(const MyApp());
}

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier<ThemeMode>(
  ThemeMode.dark,
);

//* State Management
//! ValueNotifier --->
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, value, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: value,
          home: const CalcScreen(),
        );
      },
    );
  }
}
