import 'package:flutter/material.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/base_theme.dart';

class DarkTheme extends BaseTheme {
  static final DarkTheme _instance = DarkTheme._();

  DarkTheme._();

  factory DarkTheme() => _instance;

  @override
  Color get primaryColor => Color(0xFF616161);

  @override
  Color get accentColor => Color(0xFF607D8B);

  @override
  ThemeData get data => ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        accentColor: accentColor,
        canvasColor: Color(0xFFEEEEEE),
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 18,
            color: primaryColor,
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
          ),
        ),
      );

  @override
  TextStyle get tsHistory => TextStyle(
        fontSize: 120,
        color: Color(0xFFBDBDBD).withOpacity(0.3),
        fontWeight: FontWeight.w700,
      );

  @override
  Color get colorScoreText => Color(0xFF9E9E9E);
}
