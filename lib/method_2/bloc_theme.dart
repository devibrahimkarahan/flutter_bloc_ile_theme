import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/base_theme.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/dark_theme.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/light_theme.dart';
import 'package:flutter_bloc_ile_theme/method_2/themes/orange_theme.dart';
import 'package:flutter_bloc_ile_theme/utils/pref_utils.dart';

enum SupportedTheme { LIGHT, DARK, ORANGE }

class BlocTheme extends Bloc<SupportedTheme, ThemeData> {
  static BaseTheme theme = LightTheme();

  static SystemUiOverlayStyle uiOverlayStyle() =>
      (theme.data.brightness == Brightness.light
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark)
          .copyWith(statusBarColor: Colors.transparent);

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
