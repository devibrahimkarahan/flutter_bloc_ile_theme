import 'package:flutter/material.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/base_theme.dart';

class OrangeTheme extends BaseTheme {
  static final OrangeTheme _instance = OrangeTheme._();

  OrangeTheme._();

  factory OrangeTheme() => _instance;

  @override
  ThemeData get data => ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
        accentColor: Colors.orange,
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 24, color: Colors.orange),
        ),
      );

  @override
  TextStyle get bigText => TextStyle(fontSize: 22, color: Colors.white);

  @override
  Color get buttonBackground => Colors.orange;
}
