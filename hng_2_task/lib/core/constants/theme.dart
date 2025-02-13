import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class CountryAppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(color: Palette.white),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Palette.white,
    colorScheme: ColorScheme.light(
        primary: const Color(0xffFF6C00),
        secondary: Palette.grey500,
        background: Palette.backgroundColor,
        surface: Palette.grey100,
        surfaceDim: Palette.grey500,
        tertiary: Colors.black),
    checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return Palette.grey900;
          }
          return Palette.transparent;
        }),
        side: BorderSide(color: Palette.grey500, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        checkColor: WidgetStatePropertyAll(Palette.white)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Palette.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(color: Palette.darkScaffold),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Palette.darkScaffold,
    colorScheme: ColorScheme.dark(
        primary: const Color(0xffFF6C00),
        secondary: Palette.grey400,
        background: Colors.grey[800]!,
        surface: Palette.grey200,
        surfaceDim: Palette.grey50,
        tertiary: Palette.grey300),
    checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return Palette.white;
          }
          return Palette.transparent;
        }),
        side: BorderSide(color: Palette.grey300, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        checkColor: WidgetStatePropertyAll(Palette.darkScaffold)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Palette.white),
    ),
  );
}
