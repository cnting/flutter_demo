import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/page/widget/clip/page.dart';
import 'dart:math';

import 'package:flutter_demo/util/log.dart';

class MyCustomClipPage extends StatefulWidget {
  @override
  __MyCustomClipState createState() => __MyCustomClipState();
}

class __MyCustomClipState extends State<MyCustomClipPage>
    with TickerProviderStateMixin {
  final colors = [Colors.deepPurpleAccent, Colors.green, Colors.blue];
  final maxLength = 3;
  int curIndex = 0;
  int nextActiveIndex = 0;
  double slidePercent = 0;
  DragDirection direction;
  var pages = [];
  StreamController<DragModel> streamController;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    streamController = StreamController();
    streamController.stream.listen((DragModel event) {
      setState(() {
        //正在拖动
        if (event.dragState == DragState.dragging) {
          slidePercent = event.slidePercent;
          direction = event.direction;
          if (event.direction == DragDirection.leftToRight) {
            nextActiveIndex = (curIndex - 1).clamp(0, maxLength - 1);
          } else if (event.direction == DragDirection.rightToLeft) {
            nextActiveIndex = (curIndex + 1).clamp(0, maxLength - 1);
          } else {
            nextActiveIndex = curIndex;
          }
        } else if (event.dragState == DragState.dragDone) {
          //拖动结束，继续完成剩下动画
          autoSlide(event.slidePercent, event.direction);
        } else if (event.dragState == DragState.animating) {
          slidePercent = event.slidePercent;
          direction = event.direction;
        } else if (event.dragState == DragState.animateDone) {
          if (slidePercent == 0) {
            nextActiveIndex = curIndex;
          }
          curIndex = nextActiveIndex;
          slidePercent = 0;
          direction = DragDirection.none;
          animationController.dispose();
          animationController = null;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        getPage(curIndex),
        PageReveal(slidePercent, getPage(nextActiveIndex)),
        PageDragger(streamController, curIndex > 0, curIndex < maxLength)
      ],
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  Page getPage(int index) {
    if (pages.length <= index) {
      pages.add(Page(colors[index], index));
    }
    return pages[index];
  }

  void autoSlide(double slidePercent, DragDirection direction) {
    double endPercent = 0;
    if (slidePercent < 0.5) {
      endPercent = 0;
      if (direction == DragDirection.leftToRight) {
        direction = DragDirection.rightToLeft;
      } else if (direction == DragDirection.rightToLeft) {
        direction = DragDirection.leftToRight;
      }
    } else {
      endPercent = 1;
    }

    animationController = AnimationController(
        vsync: this,
        lowerBound: min(slidePercent, endPercent),
        upperBound: max(slidePercent, endPercent),
        duration: Duration(milliseconds: 50))
      ..addListener(() {
        var value = slidePercent < 0.5
            ? slidePercent - animationController.value
            : animationController.value;

        streamController.sink
            .add(DragModel(direction, value, DragState.animating));
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          streamController.sink.add(DragModel(
              direction, animationController.value, DragState.animateDone));
        }
      });
    animationController.forward();
  }
}
