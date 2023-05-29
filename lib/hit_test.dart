import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Created by cnting on 2023/4/23

class PointerDownListener extends SingleChildRenderObjectWidget {
  final PointerDownEventListener? onPointerDown;

  PointerDownListener({Key? key, this.onPointerDown, Widget? child})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPointerDownListener()..onPointerDown = onPointerDown;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderPointerDownListener renderObject) {
    renderObject..onPointerDown = onPointerDown;
  }
}

class RenderPointerDownListener extends RenderProxyBox {
  PointerDownEventListener? onPointerDown;

  @override
  bool hitTestSelf(Offset position) {
    return true; //始终通过命中测试
  }

  @override
  void handleEvent(PointerEvent event, covariant HitTestEntry entry) {
    if (event is PointerDownEvent) onPointerDown?.call(event);
  }
}

class PointerDownListenerRoute extends StatelessWidget {
  const PointerDownListenerRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PointerDownListener(
      child: Text('click me'),
      onPointerDown: (e) => print('===>down'),
    );
  }
}

class HitTestBlocker extends SingleChildRenderObjectWidget {
  /// up 为 true 时 , `hitTest()` 将会一直返回 false.
  final bool up;

  /// down 为 true 时, 将不会调用 `hitTestChildren()`.
  final bool down;

  /// `hitTestSelf` 的返回值
  final bool self;

  HitTestBlocker(
      {Key? key,
      this.up = true,
      this.down = false,
      this.self = false,
      Widget? child})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderHitTestBlocker();
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderHitTestBlocker renderObject) {
    renderObject
      ..up = up
      ..down = down
      ..self = self;
  }
}

class RenderHitTestBlocker extends RenderProxyBox {
  RenderHitTestBlocker({this.up = true, this.down = true, this.self = true});

  bool up;
  bool down;
  bool self;

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    bool hitTestDownResult = false;
    if (!down) {
      //down为false，会调hitTestChildren()
      hitTestDownResult = hitTestChildren(result, position: position);
    }
    bool pass =
        hitTestSelf(position) || (hitTestDownResult && size.contains(position));
    if (pass) {
      result.add(BoxHitTestEntry(this, position));
    }
    return !up && pass;
  }

  @override
  bool hitTestSelf(Offset position) {
    return self;
  }
}
