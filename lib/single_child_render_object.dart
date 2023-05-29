import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Created by cnting on 2023/5/11
///单子组件，仿Center，关注布局过程
class CustomCenter extends SingleChildRenderObjectWidget {
  const CustomCenter({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCenter();
  }
}

//基础RenderShiftedBox，帮助实现布局之外的一些功能
class RenderCustomCenter extends RenderShiftedBox {
  RenderCustomCenter({RenderBox? child}) : super(child);

  @override
  void performLayout() {
    //1.先对子组件进行layout，随后获取它的size
    child!.layout(constraints.loosen(), //将约束传递给子节点
        parentUsesSize: true //因为我们接下来要使用child的size,所以不能为false
        );
    //2.根据子组件的大小确定自身大小
    //如果CustomCenter的父节点传递给它的最大约束宽高是无限大，它的宽高会设置为它子节点的宽高
    //因为在一个无限大的范围内自己的宽高也是无限大，就不知道实际宽高该多大了
    size = constraints.constrain(Size(
      constraints.maxWidth == double.infinity
          ? child!.size.width
          : double.infinity,
      constraints.maxHeight == double.infinity
          ? child!.size.height
          : double.infinity,
    ));
    //3.根据父节点子节点的大小，算出子节点在父节点居中之后的偏移，将这个偏移保存在子节点的parentData中，在后续的绘制阶段会用到
    BoxParentData parentData = child!.parentData as BoxParentData;
    parentData.offset = ((size - child!.size) as Offset) / 2;
  }
}
