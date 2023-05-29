import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Created by cnting on 2023/4/25
class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RepaintBoundary(
            child: CustomPaint(
              size: Size(300, 300),
              painter: MyPainter(),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("刷新"))
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('===>paint');
    var rect = Offset.zero & size;
    //画棋盘
    drawChessboard(canvas, rect);
    //画棋子
    drawPieces(canvas, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void drawChessboard(Canvas canvas, Rect rect) {
  var paint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..color = Color(0xFFDCC48C);
  canvas.drawRect(rect, paint);

  paint
    ..style = PaintingStyle.stroke
    ..color = Colors.black38
    ..strokeWidth = 1.0;

  for (int i = 0; i < 15; i++) {
    double dy = rect.top + rect.height / 15 * i;
    canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
  }
  for (int i = 0; i < 15; i++) {
    double dx = rect.left + rect.width / 15 * i;
    canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
  }
}

void drawPieces(Canvas canvas, Rect rect) {
  double eWidth = rect.width / 15;
  double eHeight = rect.height / 15;

  var paint = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.black;

  canvas.drawCircle(
      Offset(rect.center.dx - eWidth / 2, rect.center.dy - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint);

  paint.color = Colors.white;
  canvas.drawCircle(
    Offset(rect.center.dx + eWidth / 2, rect.center.dy - eHeight / 2),
    min(eWidth / 2, eHeight / 2) - 2,
    paint,
  );
}

///使用Layer实现绘制缓存，缓存棋盘
class ChessWidget extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderChess();
  }
}

class RenderChess extends RenderBox {
  Rect _rect = Rect.zero;
  final layerHandler = LayerHandle<PictureLayer>();

  @override
  void performLayout() {
    //确定ChessWidget的大小
    size = constraints
        .constrain(constraints.isTight ? Size.infinite : Size(150, 150));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Rect rect = offset & size;
    //检测棋盘大小是否变化，如果变化需要重新绘制棋盘并缓存
    _checkIfChessboardNeedsUpdate(rect);
    //将缓存棋盘的layer添加到context
    context.addLayer(layerHandler.layer!);
    //再画棋子
    print("paint pieces");
    drawPieces(context.canvas, rect);
  }

  _checkIfChessboardNeedsUpdate(Rect rect) {
    //如果绘制区域大小没有发生变化，则无需重绘棋盘
    if (_rect == rect) return;
    _rect = rect;
    print("paint chess board");
    //新建一个PictureLayer，用于缓存棋盘的绘制结果，并添加到layer中
    PictureRecorder recorder = PictureRecorder();
    Canvas canvas = Canvas(recorder);
    drawChessboard(canvas, rect);
    //将绘制产物保存到 pictureLayer中
    layerHandler.layer = PictureLayer(Rect.zero)..picture = recorder.endRecording();
  }

  @override
  void dispose() {
    layerHandler.layer = null;
    super.dispose();
  }
}

class PaintTest extends StatefulWidget {
  @override
  _PaintTestState createState() => _PaintTestState();
}

class _PaintTestState extends State<PaintTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChessWidget(),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("setState"))
        ],
      ),
    );
  }
}
