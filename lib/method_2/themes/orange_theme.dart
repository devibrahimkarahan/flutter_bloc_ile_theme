import 'package:flutter/material.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/base_theme.dart';

class OrangeTheme extends BaseTheme {
  static final OrangeTheme _instance = OrangeTheme._();

  OrangeTheme._();

  factory OrangeTheme() => _instance;

  @override
  Color get primaryColor => Color(0xFFFF5722);

  @override
  Color get accentColor => Color(0xFFF57C00);

  @override
  ThemeData get data => ThemeData(
        brightness: Brightness.dark,
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
  Color get colorScoreText => Color(0xFF9d4f00);
}
