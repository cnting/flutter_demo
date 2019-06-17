import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

import 'anim/AnimationSet.dart';
import 'anim/AnimationWidget.dart';
import 'anim/Hero.dart';
import 'anim/ScaleAnimation.dart';
import 'custom/CircleProgressBar.dart';
import 'custom/Gobang.dart';
import 'custom/TurnBox.dart';

class MyCustomPaint extends StatelessWidget {

  static String routeName = '${Routes.demoBase}/custom_paint';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Custom'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'Turnbox',
              ),
              Tab(
                text: '五子棋',
              ),
              Tab(
                text: '进度条',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TurnBoxRoute(),
            GobangRoute(),
            CircleProgressBarTestRoute()
          ],
        ),
      ),
    );
  }
}


