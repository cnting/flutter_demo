import 'package:flutter/material.dart';

class WidgetPoint {
  String name;
  String routeName;
  WidgetBuilder buildRouter;
  bool wrapByParent;

  WidgetPoint(
      {@required this.name,
      @required this.routeName,
      @required this.buildRouter,
      this.wrapByParent = true});

}
