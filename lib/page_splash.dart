import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ile_theme/method_1/bloc_theme.dart';
import 'package:flutter_bloc_ile_theme/method_1/page_main.dart';
import 'package:flutter_bloc_ile_theme/utils/pref_utils.dart';

class PageSplash extends StatefulWidget {
  @override
  _PageSplashState createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int themeIndex = await PrefUtils.getTheme();
      SupportedTheme theme = themeIndex == 1
          ? SupportedTheme.DARK
          : themeIndex == 2 ? SupportedTheme.ORANGE : SupportedTheme.LIGHT;
      BlocProvider.of<BlocTheme>(context).add(theme);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => PageMain(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
