import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Created by cnting on 2023/5/11
/// SizedBox会让SizedBox的子组件先满足SizedBox父组件的约束
/// 实现AccurateSizedBxo，让它遵守其父组件传递的约束而不是让其子组件去满足AccurateSizeBox父组件的约束
class AccurateSizedBox extends SingleChildRenderObjectWidget {
  final double width;
  final double height;

  const AccurateSizedBox({
    Key? key,
    this.width = 0,
    this.height = 0,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAccurateSizedBox(width, height);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderAccurateSizedBox renderObject) {
    renderObject
      ..width = width
      ..height = height;
  }
}

//RenderProxyBoxWithHitTestBehavior包含了默认的命中测试和绘制相关逻辑
class RenderAccurateSizedBox extends RenderProxyBoxWithHitTestBehavior {
  RenderAccurateSizedBox(this.width, this.height);

  double width;
  double height;

  //当前组件大小只取决于父组件传递的约束
  @override
  bool get sizedByParent => true;

  //确定当前组件大小，performResize中会调用
  @override
  Size computeDryLayout(BoxConstraints constraints) {
    //设置当前元素宽高，遵守父组件的约束
    return constraints.constrain(Size(width, height));
  }

  @override
  void performLayout() {
    child!.layout(
        BoxConstraints.tight(
            Size(min(size.width, width), min(size.height, height))),
        //父容器是固定大小，子元素大小改变时不影响父元素
        //parentUseSize为false时，子组件的布局边界会是它自身，子组件布局发生变化后不会影响当前组件
        parentUsesSize: false);
  }
}

class AccurateSizedBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      onTap: () => print("tap"),
      child: Container(
        width: 300,
        height: 300,
        color: Colors.red,
      ),
    );
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(100, 100)),
          child: SizedBox(
            width: 50,
            height: 50,
            child: child,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(100, 100)),
            child: AccurateSizedBox(
              width: 50,
              height: 50,
              child: child,
            ),
          ),
        )
      ],
    );
  }
}
