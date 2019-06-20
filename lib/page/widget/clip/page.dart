import 'package:flutter/material.dart';
import 'package:flutter_demo/util/log.dart';
import 'dart:async';

class Page extends StatelessWidget {
  final int index;
  final Color color;

  Page(this.color, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}

class PageReveal extends StatelessWidget {
  final double slidePercent;

  final Widget child;

  PageReveal(this.slidePercent, this.child);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: _PageRevealClipper(slidePercent),
      child: child,
    );
  }
}

class _PageRevealClipper extends CustomClipper<Rect> {
  final double slidePercent;

  _PageRevealClipper(this.slidePercent);

  @override
  Rect getClip(Size size) {
    double centerX = size.width / 2;
    double centerY = size.height * 0.9;
    double maxRadius = size.height * 0.9;
    double curRadius = maxRadius * slidePercent;
    return Rect.fromCircle(center: Offset(centerX, centerY), radius: curRadius);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class PageDragger extends StatefulWidget {
  final StreamController<DragModel> streamController;
  final bool canDragToLeft;
  final bool canDragToRight;

  PageDragger(this.streamController, this.canDragToLeft, this.canDragToRight);

  @override
  _PageDraggerState createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  final double maxDragDistance = 300;
  Offset dragStart;
  DragDirection dragDirection;
  double slidePercent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }

  void onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  void onDragUpdate(DragUpdateDetails details) {
    var dx = details.globalPosition.dx - dragStart.dx;

    if (dx < 0 && widget.canDragToRight) {
      dragDirection = DragDirection.rightToLeft;
    } else if (dx > 0 && widget.canDragToLeft) {
      dragDirection = DragDirection.leftToRight;
    } else {
      dragDirection = DragDirection.none;
    }
    slidePercent = (dx / maxDragDistance).abs().clamp(0, 1);
    widget.streamController.sink
        .add(DragModel(dragDirection, slidePercent, DragState.dragging));
  }

  void onDragEnd(DragEndDetails details) {
    dragStart = null;
    widget.streamController.sink
        .add(DragModel(dragDirection, slidePercent, DragState.dragDone));
  }
}

enum DragDirection { leftToRight, rightToLeft, none }
enum DragState { dragging, dragDone, animating, animateDone }

class DragModel {
  DragDirection direction;
  double slidePercent;
  DragState dragState;

  DragModel(this.direction, this.slidePercent, this.dragState);
}
