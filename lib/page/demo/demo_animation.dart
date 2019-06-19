import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

import 'anim/AnimationBuilder.dart';
import 'anim/AnimationSet.dart';
import 'anim/AnimationWidget.dart';
import 'anim/Hero.dart';
import 'anim/ScaleAnimation.dart';

class AnimationTestRoute extends StatelessWidget {
  static String routeName = '${Routes.demoBase}/animation';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Animation'),
            bottom:
                TabBar(
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      text: '图片放大',
                    ),
                    Tab(
                      text: 'AnimatedWidget',
                    ),
                    Tab(
                      text: 'AnimationBuilder',
                    ),
                    Tab(
                      text: 'Hero',
                    ),
                    Tab(
                      text: '复杂动画',
                    )
                  ],
                )
          ),
          body: TabBarView(
            children: <Widget>[
              ScaleAnimationRoute(),
              ScaleAnimationRoute2(),
              ScaleAnimationRoute3(),
              HeroRoute(),
              StaggerDemo(),
            ],
          ),
        ));
  }
}
