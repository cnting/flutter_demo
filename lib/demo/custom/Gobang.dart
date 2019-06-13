import 'dart:math';

import 'package:flutter/material.dart';

class GobangRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomPaint(
      size: Size(300, 300),
      painter: MyPainter(),
      foregroundPainter: MyForegroundPainter(),
    ));
  }
}

class MyPainter extends CustomPainter {
  final int count = 15;

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / count;
    double eHeight = size.height / count;

    //画棋盘
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);

    //画网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1.0;

    for (int i = 0; i <= count; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
    for (int i = 0; i <= count; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyForegroundPainter extends CustomPainter {
  final int count = 15;

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / count;
    double eHeight = size.height / count;
    //画一个黑子
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
