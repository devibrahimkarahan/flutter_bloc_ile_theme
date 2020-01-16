import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ile_theme/method_1/bloc_theme.dart';

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
            Text("Body1", style: Theme.of(context).textTheme.body1),
            Text("Header", style: Theme.of(context).textTheme.headline),
            Text("Subhead", style: Theme.of(context).textTheme.subhead),
            Text("Title", style: Theme.of(context).textTheme.title),
            Text("Subtitle", style: Theme.of(context).textTheme.subtitle),
            RaisedButton(
              onPressed: () => themeTapped(SupportedTheme.DARK),
              child: Text("Dark", style: Theme.of(context).textTheme.button),
            ),
            RaisedButton(
              onPressed: () => themeTapped(SupportedTheme.LIGHT),
              child: Text("Light", style: Theme.of(context).textTheme.button),
            ),
            RaisedButton(
              onPressed: () => themeTapped(SupportedTheme.ORANGE),
              child: Text("Orange", style: Theme.of(context).textTheme.button),
            ),
          ],
        ),
      ),
    );
  }
}
