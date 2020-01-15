import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ile_theme/method_2/bloc_theme.dart';

class PageMain extends StatefulWidget {
  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  void themeTapped(SupportedTheme theme) {
    BlocProvider.of<BlocTheme>(context).add(theme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tema desteği"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Merhaba Dünya", style: BlocTheme.theme.data.textTheme.body1),
            RaisedButton(
              onPressed: () => themeTapped(SupportedTheme.DARK),
              color: BlocTheme.theme.buttonBackground,
              child: Text("Dark", style: BlocTheme.theme.data.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => themeTapped(SupportedTheme.LIGHT),
              color: BlocTheme.theme.buttonBackground,
              child:
                  Text("Light", style: BlocTheme.theme.data.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => themeTapped(SupportedTheme.ORANGE),
              color: BlocTheme.theme.buttonBackground,
              child:
                  Text("Orange", style: BlocTheme.theme.data.textTheme.button),
            ),
          ],
        ),
      ),
    );
  }
}
