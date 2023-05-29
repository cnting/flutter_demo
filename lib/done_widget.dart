import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_checkbox.dart';

/// Created by cnting on 2023/4/25
class DoneWidget extends LeafRenderObjectWidget {
  const DoneWidget(
      {Key? key,
      this.strokeWidth = 2.0,
      this.color = Colors.green,
      this.outline = false,
      this.onChanged})
      : super(key: key);

  final double strokeWidth;
  final Color color;
  final bool outline;
  final ValueChanged<bool>? onChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderDoneObject(strokeWidth, color, outline, onChanged)
      ..animationStatus = AnimationStatus.forward;
  }

  @override
  void updateRenderObject(BuildContext context, RenderDoneObject renderObject) {
    renderObject
      ..strokeWidth = strokeWidth
      ..outline = outline
      ..color = color
      ..onChanged = onChanged;
  }
}

class RenderDoneObject extends RenderBox with RenderObjectAnimationMixin {
  double strokeWidth;
  Color color;
  bool outline;

  ValueChanged<bool>? onChanged;

  RenderDoneObject(this.strokeWidth, this.color, this.outline, this.onChanged);

  @override
  Duration get duration => const Duration(milliseconds: 300);

  @override
  void doPaint(PaintingContext context, Offset offset) {
    Curve curve = Curves.easeIn;
    final _progress = curve.transform(progress);

    Rect rect = offset & size;
    final paint = Paint()
      ..isAntiAlias = true
      ..style = outline ? PaintingStyle.stroke : PaintingStyle.fill
      ..color = color;

    if (outline) {
      paint.strokeWidth = strokeWidth;
      rect = rect.deflate(strokeWidth / 2);
    }

    context.canvas.drawCircle(rect.center, rect.shortestSide / 2, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = outline ? color : Colors.white
      ..strokeWidth = strokeWidth;

    final path = Path();

    Offset firstOffset =
        Offset(rect.left + rect.width / 6, rect.top + rect.height / 2.1);
    Offset secondOffset =
        Offset(rect.left + rect.width / 2.5, rect.bottom - rect.height / 3.3);
    path.moveTo(firstOffset.dx, firstOffset.dy);

    const adjustProgress = .6;
    if (_progress < adjustProgress) {
      Offset _secondOffset =
          Offset.lerp(firstOffset, secondOffset, _progress / adjustProgress)!;
      path.lineTo(_secondOffset.dx, _secondOffset.dy);
    } else {
      path.lineTo(secondOffset.dx, secondOffset.dy);
      final lastOffset =
          Offset(rect.right - rect.width / 5, rect.top + rect.height / 3.5);
      Offset _lastOffset = Offset.lerp(secondOffset, lastOffset,
          (progress - adjustProgress) / (1 - adjustProgress))!;
      path.lineTo(_lastOffset.dx, _lastOffset.dy);
    }

    context.canvas.drawPath(path, paint..style = PaintingStyle.stroke);
  }

  @override
  void performLayout() {
    size = constraints
        .constrain(constraints.isTight ? Size.infinite : const Size(25, 25));
  }
}

class DoneWidgetRoute extends StatefulWidget {
  @override
  _DoneWidgetRouteState createState() => _DoneWidgetRouteState();
}

class _DoneWidgetRouteState extends State<DoneWidgetRoute> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DoneWidget(outline: false, onChanged: _onChange),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: 16,
              height: 16,
              child: DoneWidget(
                strokeWidth: 1,
                outline: true,
                onChanged: _onChange,
              ),
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
