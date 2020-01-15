import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ile_theme/method_1/app_theme.dart';

enum SupportedTheme { LIGHT, DARK, ORANGE }

class BlocTheme extends Bloc<SupportedTheme, ThemeData> {
  @override
  ThemeData get initialState => AppTheme.theme;

  @override
  Stream<ThemeData> mapEventToState(SupportedTheme event) async* {
    AppTheme.changeTheme(event);
    yield AppTheme.theme;
  }
}
