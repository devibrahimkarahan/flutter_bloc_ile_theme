import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ile_theme/method_1/bloc_theme.dart';
import 'package:flutter_bloc_ile_theme/page_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocTheme>(
      create: (_) => BlocTheme(),
      child: BlocBuilder<BlocTheme, ThemeData>(
        builder: (context, themeData) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: PageSplash(),
          );
        },
      ),
    );
  }
}
