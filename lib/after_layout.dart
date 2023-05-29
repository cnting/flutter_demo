import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

/// Created by cnting on 2023/5/11
///在布局结束后拿到子组件的代理渲染对象，

class AfterLayout extends SingleChildRenderObjectWidget {
  //组件树布局结束后会被触发，注意，不是当前组件布局结束后触发
  final ValueSetter<RenderAfterLayout> callback;

  AfterLayout({
    Key? key,
    required this.callback,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAfterLayout(callback);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderAfterLayout renderObject) {
    renderObject..callback = callback;
  }
}

class RenderAfterLayout extends RenderProxyBox {
  RenderAfterLayout(this.callback);

  ValueSetter<RenderAfterLayout> callback;

  @override
  void performLayout() {
    super.performLayout();
    //不能直接回掉callback,原因是当前组件布局完成后可能还有其他组件未完成布局，
    //如果callback中又触发了UI更新（比如调用了setState）则会报错。因此我们在frame结束的时候再去触发回调
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      callback(this);
    });
  }

  //组件在屏幕坐标中的起始点坐标（偏移）
  Offset get offset => localToGlobal(Offset.zero);

  //组件在屏幕上占有的矩形空间区域
  Rect get rect => offset & size;
}
