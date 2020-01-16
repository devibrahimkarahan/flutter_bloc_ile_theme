import 'package:flutter/material.dart';
import 'package:flutter_bloc_ile_theme/method_1/bloc_theme.dart';

class AppTheme {
  static ThemeData _currentTheme = _lightTheme;

  static void changeTheme(SupportedTheme theme) {
    switch (theme) {
      case SupportedTheme.LIGHT:
        _currentTheme = _lightTheme;
        break;
      case SupportedTheme.DARK:
        _currentTheme = _darkTheme;
        break;
      case SupportedTheme.ORANGE:
        _currentTheme = _orangeTheme;
        break;
    }
  }

  static ThemeData get theme => _currentTheme;

  static ThemeData _darkTheme = ThemeData.dark().copyWith(
    accentColor: Colors.white,
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 10),
    ),
  );

  static ThemeData _lightTheme = ThemeData.light().copyWith(
    accentColor: Colors.black,
  );

  static ThemeData _orangeTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.teal,
    accentColor: Colors.orange,
    textTheme: TextTheme(
      body1: TextStyle(fontSize: 24, color: Colors.orange),
      headline: TextStyle(fontSize: 100, color: Colors.orange),
    ),
  );
}
