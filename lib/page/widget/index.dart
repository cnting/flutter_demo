import 'package:flutter/material.dart';
import 'package:flutter_demo/model/widget.dart';
import 'package:flutter_demo/page/widget/widget_indexedstack.dart';
import 'package:flutter_demo/page/widget/widget_safearea.dart';
import 'package:flutter_demo/page/widget/widget_stepper.dart';

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
      name: 'Stepper',
      routeName: MyStepper.routeName,
      buildRouter: (context) => MyStepper()),
  WidgetPoint(
      name: 'Safearea',
      routeName: MySafeArea.routeName,
      buildRouter: (context) => MySafeArea()),
  WidgetPoint(
      name: 'IndexedStack',
      routeName: MyIndexedStack.routeName,
      buildRouter: (context) => MyIndexedStack()),
];
