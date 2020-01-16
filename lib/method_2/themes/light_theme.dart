import 'package:flutter/material.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/base_theme.dart';

class LightTheme extends BaseTheme {
  static final LightTheme _instance = LightTheme._();

  LightTheme._();

  factory LightTheme() => _instance;

  @override
  Color get primaryColor => Color(0xFF00796B);

  @override
  Color get accentColor => Color(0xFF00BCD4);

  @override
  ThemeData get data => ThemeData.light().copyWith(
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
  Color get colorScoreText => Color(0xFF3C786B);
}
