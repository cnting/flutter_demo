import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircleProgressBar extends StatelessWidget {
  CustomCircleProgressBar(
      {this.strokeWidth = 10.0,
      this.strokeColor,
      this.bgColor = Colors.grey,
      this.isCircleCap = true,
      this.startDegree,
      this.sweepDegree});

  final double strokeWidth;
  final List<Color> strokeColor;
  final Color bgColor;
  final bool isCircleCap;
  final double startDegree;
  final double sweepDegree;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(bgColor: bgColor, strokeWidth: strokeWidth),
      foregroundPainter: MyForegroundPainter(
          strokeWidth: strokeWidth,
          strokeColor: strokeColor,
          isCircleCap: isCircleCap,
          startDegree: startDegree,
          sweepDegree: sweepDegree),
    );
  }
}

class MyPainter extends CustomPainter {
  final Color bgColor;
  final double strokeWidth;

  MyPainter({this.bgColor, this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    //画背景圆
    var paint = Paint()
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = bgColor;
    var radius = min(size.width, size.height) / 2 - strokeWidth;
    canvas.drawCircle(size.center(Offset.zero), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyForegroundPainter extends CustomPainter {
  final double strokeWidth;
  final List<Color> strokeColor;
  final bool isCircleCap;
  double startDegree;
  final double sweepDegree;

  MyForegroundPainter(
      {this.strokeWidth,
      this.strokeColor,
      this.isCircleCap,
      this.startDegree,
      this.sweepDegree});

  @override
  void paint(Canvas canvas, Size size) {
    if (isCircleCap) {
      startDegree = startDegree ?? 0;
      startDegree += asin(strokeWidth / (size.width - strokeWidth));
//      startDegree +=
//          atan((strokeWidth / 2) / (size.width / 2 - strokeWidth / 2));
    }

    Rect rect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var paint = Paint()
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = strokeColor[0]
      ..shader = SweepGradient(colors: strokeColor).createShader(rect)
      ..strokeCap = isCircleCap ? StrokeCap.round : StrokeCap.butt;
    canvas.drawArc(rect, startDegree, sweepDegree, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CircleProgressBarTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CircleProgressBarTestState();
  }
}

class _CircleProgressBarTestState extends State<CircleProgressBarTestRoute>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 0.0, end: 2 * pi).animate(animationController);
    animationController.repeat(period: Duration(seconds: 2));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        CustomCircleProgressBar(
          strokeWidth: 10,
          strokeColor: [Colors.green, Colors.green[50]],
          bgColor: Colors.grey[350],
          sweepDegree: pi,
        ),
        CustomCircleProgressBar(
          strokeWidth: 10,
          strokeColor: [Colors.blue, Colors.blue[50]],
          bgColor: Colors.grey[350],
          sweepDegree: pi / 2,
        ),
        RotationTransition(
          turns: animationController,
          child: CustomCircleProgressBar(
            strokeWidth: 10,
            strokeColor: [Colors.blue, Colors.blue[50]],
            bgColor: Colors.grey[350],
            sweepDegree: pi / 2,
          ),
        ),
        AnimatedProgressBar(
          animation: animation,
        ),
        RotatedBox(
          quarterTurns: (animationController.value * 360).toInt(),
          child: CustomCircleProgressBar(
            strokeWidth: 10,
            strokeColor: [Colors.blue, Colors.blue[50]],
            bgColor: Colors.grey[350],
            sweepDegree: pi / 2,
          ),
        )
      ],
    );
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  AnimatedProgressBar({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return CustomCircleProgressBar(
      strokeWidth: 10,
      strokeColor: [Colors.blue, Colors.blue[50]],
      bgColor: Colors.grey[350],
      startDegree: animation.value,
      sweepDegree: pi / 2,
    );
  }
}
