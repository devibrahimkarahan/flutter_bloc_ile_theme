import 'package:flutter/material.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/base_theme.dart';

class LightTheme extends BaseTheme {
  static final LightTheme _instance = LightTheme._();

  LightTheme._();

  factory LightTheme() => _instance;

  @override
  ThemeData get data => ThemeData.light().copyWith(
        accentColor: Colors.black,
      );

  @override
  TextStyle get bigText => TextStyle(fontSize: 33, color: Colors.black);

  @override
  Color get buttonBackground => const Color(0xffd3d3d3);
}
