import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Created by cnting on 2023/4/21
class CustomAlign extends SingleChildRenderObjectWidget {
  final Alignment alignment;

  const CustomAlign(
      {Key? key, Widget? child, this.alignment = Alignment.topLeft})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return AlignRenderBox(alignment: alignment);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant AlignRenderBox renderObject) {
    renderObject.alignment = alignment;
  }
}

class AlignRenderBox extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  Alignment alignment;

  AlignRenderBox({RenderBox? child, required this.alignment}) {
    this.child = child;
  }

  @override
  void performLayout() {
    if (child == null) {
      size = Size.zero;
    } else {
      size = constraints.constrain(Size.infinite); //尽可能填满
      child!
          .layout(constraints.loosen(), parentUsesSize: true); //不对child的大小进行限制
      BoxParentData parentData = child!.parentData as BoxParentData;
      parentData.offset =
          alignment.alongOffset(size - child!.size as Offset); //设置偏移
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    if (child != null) {
      BoxParentData parentData = child!.parentData as BoxParentData;
      context.paintChild(child!, offset + parentData.offset);
    }
  }
}
