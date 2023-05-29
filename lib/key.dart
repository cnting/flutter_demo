import 'dart:math';

import 'package:flutter/material.dart';

/// Created by cnting on 2023/5/17

class RandomColor {
  Color randomColor() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }
}

class StatelessContainer extends StatelessWidget {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key? key}) : super(key: key);

  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class KeyTest extends StatefulWidget {
  @override
  _KeyTestState createState() => _KeyTestState();
}

class _KeyTestState extends State<KeyTest> {
  // List<Widget> widgets = [StatefulContainer(key: UniqueKey(),), StatefulContainer(key: UniqueKey(),)];
  List<Widget> widgets = [
    Padding(
      key: UniqueKey(),
      padding: EdgeInsets.all(8),
      child: StatefulContainer(

      ),
    ),
    Padding(
      key: UniqueKey(),
      padding: EdgeInsets.all(8),
      child: StatefulContainer(
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  switchWidget() {
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}
