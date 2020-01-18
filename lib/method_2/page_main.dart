import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ile_theme/method_2/bloc_theme.dart';

class PageMain extends StatefulWidget {
  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: BlocTheme.uiOverlayStyle(),
      child: WillPopScope(
        // ignore: missing_return
        onWillPop: () async {
          await SystemChannels.platform.invokeMethod("SystemNavigator.pop");
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).canvasColor,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(
                top: 100,
                left: 32,
                right: 12,
                child: FittedBox(
                  alignment: Alignment.topCenter,
                  child: Text("History", style: BlocTheme.theme.tsHistory),
                ),
              ),
              Positioned.fill(
                right: 0,
                bottom: 0,
                left: 0,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: index == 0
                          ? EdgeInsets.fromLTRB(24, 124, 24, 24)
                          : EdgeInsets.all(24),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "matchday - no. ${10 - index}".toUpperCase(),
                            style: Theme.of(context).textTheme.headline,
                          ),
                          SizedBox(height: 9),
                          Column(
                            children: List<Widget>.generate(
                              3,
                              (f) => buildItem(context),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomPaint(
                  painter: HeaderPainter(Theme.of(context).primaryColor),
                  child: Container(
                    padding:
                        EdgeInsets.only(top: media.padding.top, bottom: 24),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.keyboard_backspace,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<BlocTheme>(context)
                                      .add(SupportedTheme.LIGHT);
                                },
                                icon: Icon(
                                  Icons.filter_1,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<BlocTheme>(context)
                                      .add(SupportedTheme.DARK);
                                },
                                icon: Icon(
                                  Icons.filter_2,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<BlocTheme>(context)
                                      .add(SupportedTheme.ORANGE);
                                },
                                icon: Icon(
                                  Icons.filter_3,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context) {
    int num1 = Random().nextInt(10);
    int num2 = Random().nextInt(10);
    return Container(
      margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
      padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(.15),
            offset: Offset(0, 15),
            blurRadius: 20,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              "01.04.2019",
              style: TextStyle(
                color: Colors.black12,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  "https://picsum.photos/${100 + Random().nextInt(50)}",
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
              Text(
                "$num1",
                style: num1 < num2
                    ? BlocTheme.theme.tsLoserScore
                    : BlocTheme.theme.tsWinnerScore,
              ),
              Text(
                "$num2",
                style: num2 < num1
                    ? BlocTheme.theme.tsLoserScore
                    : BlocTheme.theme.tsWinnerScore,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  "https://picsum.photos/${100 + Random().nextInt(50)}",
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderPainter extends CustomPainter {
  final Color color;

  HeaderPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.7, 0);

    Path shadowPath = Path();
    shadowPath.lineTo(0, size.height);
    shadowPath.lineTo(size.width * 0.85 + 10, 0);

    canvas.drawShadow(shadowPath, color.withOpacity(.6), 20, true);
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
