import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/custom_sliver.dart';

/// Created by cnting on 2023/4/23
typedef SliverPersistentHeaderToBoxBuilder = Widget Function(
    BuildContext context, double maxExtent, bool fixed);

class SliverPersistentHeaderToBox extends StatelessWidget {
  final SliverPersistentHeaderToBoxBuilder builder;

  // 默认构造函数，直接接受一个 widget，不用显式指定高度
  SliverPersistentHeaderToBox({Key? key, required Widget child})
      : builder = ((a, b, c) => child),
        super(key: key);

  SliverPersistentHeaderToBox.builder({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SliverPersistentHeaderToBox(
        child: LayoutBuilder(builder: (context, constraints) {
      return builder(
          context,
          constraints.maxHeight,
          //约束中需要传递的额外信息是一个bool类型，表示 Sliver 是否已经固定到顶部
          (constraints as ExtraInfoBoxConstraints<bool>).extra);
    }));
  }
}

class _SliverPersistentHeaderToBox extends SingleChildRenderObjectWidget {
  final Widget child;

  _SliverPersistentHeaderToBox({Key? key, required this.child})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSliverPersistentHeaderToBox();
  }
}

class _RenderSliverPersistentHeaderToBox extends RenderSliverSingleBoxAdapter {
  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    //只要 constraints.scrollOffset不为0，则表示已经有内容在当前Sliver下面了，即已经固定到顶部了
    child?.layout(
        ExtraInfoBoxConstraints(
            constraints.scrollOffset != 0,
            constraints.asBoxConstraints(
                maxExtent: constraints.remainingPaintExtent)),
        //我们要根据child大小来确定Sliver大小，所以后面需要用到child的大小（size）信息
        parentUsesSize: true);

    // 子节点 layout 后就能获取它的大小了
    double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
        break;
      case Axis.vertical:
        childExtent = child!.size.height;
        break;
    }

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintOrigin: 0, // 固定，如果不想固定应该传` - constraints.scrollOffset`
      paintExtent: childExtent,
      maxPaintExtent: childExtent,
    );
  }

  @override
  double childMainAxisPosition(covariant RenderBox child) {
    return 0;
  }
}
