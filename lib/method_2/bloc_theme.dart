import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/base_theme.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/dark_theme.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/light_theme.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/orange_theme.dart';
import 'package:flutter_bloc_ile_theme/utils/pref_utils.dart';

enum SupportedTheme { LIGHT, DARK, ORANGE }

class BlocTheme extends Bloc<SupportedTheme, ThemeData> {
  // ignore: close_sinks
  static final BlocTheme _instance = BlocTheme._();

  BlocTheme._();

  factory BlocTheme() => _instance;

  static BaseTheme theme = LightTheme();

  @override
  ThemeData get initialState => theme.data;

  @override
  Stream<ThemeData> mapEventToState(SupportedTheme event) async* {
    if (event == SupportedTheme.LIGHT) {
      theme = LightTheme();
    } else if (event == SupportedTheme.DARK) {
      theme = DarkTheme();
    } else if (event == SupportedTheme.ORANGE) {
      theme = OrangeTheme();
    }
    int themeIndex = event == SupportedTheme.DARK
        ? 1
        : event == SupportedTheme.ORANGE ? 2 : 0;
    await PrefUtils.saveTheme(themeIndex);
    yield theme.data;
  }
}
