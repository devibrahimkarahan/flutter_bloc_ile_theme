import 'package:flutter/material.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/base_theme.dart';

class DarkTheme implements BaseTheme {
  static final DarkTheme _instance = DarkTheme._();

  DarkTheme._();

  factory DarkTheme() => _instance;

  @override
  ThemeData get data => ThemeData.dark().copyWith(
        accentColor: Colors.white,
      );

  @override
  TextStyle get bigText => TextStyle(fontSize: 44, color: Colors.white);

  @override
  Color get buttonBackground => Colors.grey;
}
