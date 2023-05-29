import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

/// Created by cnting on 2023/4/25
class CustomCheckbox extends LeafRenderObjectWidget {
  final double strokeWidth;
  final Color strokeColor;
  final Color? fillColor;
  final bool value;
  final double radius;
  final ValueChanged<bool>? onChanged;

  const CustomCheckbox({
    Key? key,
    this.strokeWidth = 2.0,
    this.value = false,
    this.strokeColor = Colors.white,
    this.fillColor = Colors.blue,
    this.radius = 2.0,
    this.onChanged,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCheckbox(strokeWidth, strokeColor,
        fillColor ?? Theme.of(context).primaryColor, value, radius, onChanged);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderCustomCheckbox renderObject) {
    if (renderObject.value != value) {
      renderObject.animationStatus =
          value ? AnimationStatus.forward : AnimationStatus.reverse;
    }
    renderObject
      ..strokeWidth = strokeWidth
      ..strokeColor = strokeColor
      ..fillColor = fillColor ?? Theme.of(context).primaryColor
      ..radius = radius
      ..value = value
      ..onChanged = onChanged;
  }
}

class RenderCustomCheckbox extends RenderBox with RenderObjectAnimationMixin {
  bool value;
  int pointerId = -1;
  double strokeWidth;
  Color strokeColor;
  Color fillColor;
  double radius;
  ValueChanged<bool>? onChanged;

  RenderCustomCheckbox(this.strokeWidth, this.strokeColor, this.fillColor,
      this.value, this.radius, this.onChanged) {
    progress = value ? 1 : 0;
  }

  //背景动画时长占比（背景动画要在前40%的时间内执行完毕，之后执行打勾动画）
  final double bgAnimationInterval = .4;

  bool get isRepaintBoundary => true;

  @override
  void performLayout() {
    size = constraints
        .constrain(constraints.isTight ? Size.infinite : Size(25, 25));
  }

  @override
  void doPaint(PaintingContext context, Offset offset) {
    Rect rect = offset & size;
    _drawBackground(context, rect);
    _drawCheckMark(context, rect);
  }

  void _drawBackground(PaintingContext context, Rect rect) {
    Color color = value ? fillColor : Colors.grey;
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth
      ..color = color;

    final outer = RRect.fromRectXY(rect, radius, radius);
    var rects = [
      rect.inflate(-strokeWidth),
      Rect.fromCenter(
        center: rect.center,
        width: 0,
        height: 0,
      )
    ];
    // 根据动画执行进度调整来确定里面矩形在每一帧的大小
    var rectProgress = Rect.lerp(rects[0], rects[1],
        min(progress, bgAnimationInterval) / bgAnimationInterval)!;
    final inner = RRect.fromRectXY(rectProgress, 0, 0);
    context.canvas.drawDRRect(outer, inner, paint);
  }

  void _drawCheckMark(PaintingContext context, Rect rect) {
    //画好背景后再画前景
    if (progress > bgAnimationInterval) {
      //确定中间拐点位置
      final secondOffset =
          Offset(rect.left + rect.width / 2.5, rect.bottom - rect.height / 4);
      //第三个点位置
      final lastOffset =
          Offset(rect.right - rect.width / 6, rect.top + rect.height / 4);
      //只对第三个点做插值
      final _lastOffset = Offset.lerp(secondOffset, lastOffset,
          (progress - bgAnimationInterval) / (1 - bgAnimationInterval))!;
      final path = Path()
        ..moveTo(rect.left + rect.width / 7, rect.top + rect.height / 2)
        ..lineTo(secondOffset.dx, secondOffset.dy)
        ..lineTo(_lastOffset.dx, _lastOffset.dy);

      final paint = Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.stroke
        ..color = strokeColor
        ..strokeWidth = strokeWidth;

      context.canvas.drawPath(path, paint..style = PaintingStyle.stroke);
    }
  }

  //如果动画未结束，标记为"需要重绘"
  void _scheduleAnimation() {
    if (_animationStatus != AnimationStatus.completed) {
      // 需要在Flutter 当前frame 结束之前再执行，因为不能在绘制过程中又将组件标记为需要重绘
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        if (_lastTimeStamp != null) {
          double delta = (timeStamp.inMilliseconds - _lastTimeStamp!) /
              duration.inMilliseconds;
          // 如果是反向动画，则 progress值要逐渐减小
          if (_animationStatus == AnimationStatus.reverse) {
            delta = -delta;
          }
          progress = progress + delta;

          if (progress >= 1 || progress <= 0) {
            _animationStatus = AnimationStatus.completed;
            progress = progress.clamp(0, 1);
          }
        }
        //标记为重绘
        markNeedsPaint();
        _lastTimeStamp = timeStamp.inMilliseconds;
      });
    } else {
      _lastTimeStamp = null;
    }
  }

  @override
  bool hitTestSelf(Offset position) {
    return true;
  }

// 只有通过命中测试，才会调用本方法，我们在手指抬起时触发事件即可
  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    if (event.down) {
      pointerId = event.pointer;
    } else if (pointerId == event.pointer) {
      onChanged?.call(!value);
    }
  }
}

mixin RenderObjectAnimationMixin on RenderObject {
  double _progress = 0;
  int? _lastTimeStamp;

  Duration get duration => const Duration(milliseconds: 200);
  AnimationStatus _animationStatus = AnimationStatus.completed;

  set animationStatus(AnimationStatus v) {
    if (_animationStatus != v) {
      markNeedsPaint();
    }
    _animationStatus = v;
  }

  double get progress => _progress;

  set progress(double v) {
    _progress = v.clamp(0, 1);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    doPaint(context, offset);
    _scheduleAnimation();
  }

  void _scheduleAnimation() {
    if (_animationStatus != AnimationStatus.completed) {
      // 需要在Flutter 当前frame 结束之前再执行，因为不能在绘制过程中又将组件标记为需要重绘
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        if (_lastTimeStamp != null) {
          double delta = (timeStamp.inMilliseconds - _lastTimeStamp!) /
              duration.inMilliseconds;

          //在特定情况下，可能在一帧中连续的往frameCallback中添加了多次，导致两次回调时间间隔为0，
          //这种情况下应该继续请求重绘。
          if (delta == 0) {
            markNeedsPaint();
            return;
          }
          // 如果是反向动画，则 progress值要逐渐减小
          if (_animationStatus == AnimationStatus.reverse) {
            delta = -delta;
          }
          progress = progress + delta;

          if (progress >= 1 || progress <= 0) {
            _animationStatus = AnimationStatus.completed;
            progress = progress.clamp(0, 1);
          }
        }
        //标记为重绘
        markNeedsPaint();
        _lastTimeStamp = timeStamp.inMilliseconds;
      });
    } else {
      _lastTimeStamp = null;
    }
  }

  //子类实现绘制逻辑
  void doPaint(PaintingContext context, Offset offset);
}

class CustomCheckboxTest extends StatefulWidget {
  @override
  _CustomCheckboxTestState createState() => _CustomCheckboxTestState();
}

class _CustomCheckboxTestState extends State<CustomCheckboxTest> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCheckbox(value: _checked, onChanged: _onChange),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: 16,
              height: 16,
              child: CustomCheckbox(
                strokeWidth: 1,
                radius: 1,
                value: _checked,
                onChanged: _onChange,
              ),
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: CustomCheckbox(
              strokeWidth: 3,
              radius: 3,
              value: _checked,
              onChanged: _onChange,
            ),
          ),
        ],
      ),
    );
  }

  void _onChange(value) {
    setState(() => _checked = value);
  }
}
