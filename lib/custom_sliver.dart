import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Created by cnting on 2023/4/23

typedef SliverFlexibleHeaderBuilder = Widget Function(
    BuildContext context, double maxExtent, ScrollDirection direction);

class SliverFlexibleHeader extends StatelessWidget {
  final SliverFlexibleHeaderBuilder builder;
  final double visibleExtent;

  const SliverFlexibleHeader(
      {super.key, required this.builder, required this.visibleExtent});

  @override
  Widget build(BuildContext context) {
    return _SliverFlexibleHeader(
        visibleExtent: visibleExtent,
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            return builder(
                context,
                constraints.maxHeight,
                (constraints as ExtraInfoBoxConstraints<ScrollDirection>)
                    .extra);
          },
        ));
  }
}

class _SliverFlexibleHeader extends SingleChildRenderObjectWidget {
  final double visibleExtent;

  const _SliverFlexibleHeader({
    Key? key,
    required Widget child,
    this.visibleExtent = 0,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _FlexibleHeaderRenderSliver(visibleExtent);
  }

  @override
  void updateRenderObject(
      BuildContext context, _FlexibleHeaderRenderSliver renderObject) {
    renderObject..visibleExtent = visibleExtent;
  }
}

class _FlexibleHeaderRenderSliver extends RenderSliverSingleBoxAdapter {
  _FlexibleHeaderRenderSliver(double visibleExtent)
      : _visibleExtent = visibleExtent;

  late double _visibleExtent = 0;
  double _lastOverScroll = 0;
  double _lastScrollOffset = 0;
  bool _report = false;

  // 是否需要修正scrollOffset。当_visibleExtent值更新后，为了防止
  // 视觉上突然地跳动，要先修正 scrollOffset。
  double? _scrollOffsetCorrection;
  ScrollDirection _direction = ScrollDirection.idle;

  set visibleExtent(double value) {
    //可视长度发生变化，更新状态并重新布局
    if (_visibleExtent != value) {
      _lastOverScroll = 0;
      _report = false;
      _scrollOffsetCorrection = value - _visibleExtent;
      _visibleExtent = value;
      markNeedsLayout();
    }
  }

  //通过Viewport传来的SliverConstraints结合子组件的高度，最终确定了_SliverFlexibleHeader的布局、绘制等信息，保存到geometry
  @override
  void performLayout() {
    print(
        '===>_visibleExtent:${_visibleExtent},constraints.scrollOffset:${constraints.scrollOffset},overlap:${constraints.overlap}，remainPaintExtent:${constraints.remainingPaintExtent}');
    // _visibleExtent 值更新后，为了防止突然的跳动，先修正 scrollOffset
    if (_scrollOffsetCorrection != null) {
      geometry =
          SliverGeometry(scrollOffsetCorrection: _scrollOffsetCorrection);
      _scrollOffsetCorrection = null;
      return;
    }
    if (child == null) {
      geometry = SliverGeometry(scrollExtent: _visibleExtent);
      return;
    }
    //滑动距离大于 _visibleExtent 时则表示子节点已经在屏幕外了
    if (constraints.scrollOffset > _visibleExtent) {
      geometry = SliverGeometry(scrollExtent: _visibleExtent);
      if (!_report) {
        _report = true;
        child?.layout(
            ExtraInfoBoxConstraints(
                _direction, constraints.asBoxConstraints(maxExtent: 0)),
            parentUsesSize: false);
      }
      return;
    }
    _report = false;

    //overlap：上一个 sliver 覆盖当前 sliver 的长度（重叠部分的长度），通常在 sliver 是 pinned/floating
    //下拉过程中overlap会一直变化
    double overScroll = constraints.overlap < 0 ? constraints.overlap.abs() : 0;
    var scrollOffset = constraints.scrollOffset;
    _direction = ScrollDirection.idle;

    // 根据前后的overScroll值之差确定列表滑动方向。注意，不能直接使用 constraints.userScrollDirection，
    // 这是因为该参数只表示用户滑动操作的方向。比如当我们下拉超出边界时，然后松手，此时列表会弹回，即列表滚动
    // 方向是向上，而此时用户操作已经结束，ScrollDirection 的方向是上一次的用户滑动方向(向下)，这是便有问题。
    var distance = overScroll > 0
        ? overScroll - _lastOverScroll
        : _lastScrollOffset - scrollOffset;
    _lastOverScroll = overScroll;
    _lastScrollOffset = scrollOffset;

    if (constraints.userScrollDirection == ScrollDirection.idle) {
      _direction = ScrollDirection.idle;
      _lastOverScroll = 0;
    } else if (distance > 0) {
      _direction = ScrollDirection.forward;
    } else if (distance < 0) {
      _direction = ScrollDirection.reverse;
    }

    // 在Viewport中顶部的可视空间为该 Sliver 可绘制的最大区域。
    // 1. 如果Sliver已经滑出可视区域则 constraints.scrollOffset 会大于 _visibleExtent，
    //    这种情况我们在一开始就判断过了。
    // 2. 如果我们下拉超出了边界，此时 overScroll>0，scrollOffset 值为0，所以最终的绘制区域为
    //    _visibleExtent + overScroll.
    double paintExtent = _visibleExtent + overScroll - constraints.scrollOffset;

    //绘制高度不超过最大可绘制空间
    paintExtent = min(paintExtent, constraints.remainingPaintExtent);
    //对子组件进行布局，子组件通过 LayoutBuilder 可以拿到这里我们传递的约束对象（ExtraInfoBoxConstraints）
    child?.layout(
        ExtraInfoBoxConstraints(
            _direction, constraints.asBoxConstraints(maxExtent: paintExtent)),
        parentUsesSize: false);
    double layoutExtent = min(_visibleExtent, paintExtent);

    //设置geometry，Viewport在布局时会用到
    geometry = SliverGeometry(
        //Sliver在主轴方向预估长度
        scrollExtent: _visibleExtent, //layoutExtent,
        //绘制的坐标原点，相对于自身布局位置
        paintOrigin: -overScroll,
        //可视区域中的绘制长度
        paintExtent: paintExtent,
        //最大绘制长度
        maxPaintExtent: paintExtent,
        //在 Viewport中占用的长度；如果列表滚动方向是垂直方向，则表示列表高度。范围[0,paintExtent]
        layoutExtent: layoutExtent);
  }
}

class ExtraInfoBoxConstraints<T> extends BoxConstraints {
  ExtraInfoBoxConstraints(this.extra, BoxConstraints constraints)
      : super(
            minWidth: constraints.minWidth,
            minHeight: constraints.minHeight,
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight);

  final T extra;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExtraInfoBoxConstraints &&
        super == other &&
        other.extra == extra;
  }

  @override
  int get hashCode {
    return hashValues(super.hashCode, extra);
  }
}
