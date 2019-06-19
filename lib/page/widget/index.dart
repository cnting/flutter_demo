import 'package:flutter_demo/model/widget.dart';
import 'package:flutter_demo/page/widget/widget_indexedstack.dart';
import 'package:flutter_demo/page/widget/widget_safearea.dart';
import 'package:flutter_demo/page/widget/widget_stepper.dart';
import 'package:flutter_demo/page/widget/widget_streambuilder.dart';

import 'widget_futurebuilder.dart';

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
      name: 'Stepper',
      routeName: MyStepper.routeName,
      buildRouter: (context) => MyStepper()),
  WidgetPoint(
      name: 'Safearea',
      routeName: MySafeArea.routeName,
      buildRouter: (context) => MySafeArea(),
      wrapByParent: false),
  WidgetPoint(
      name: 'IndexedStack',
      routeName: MyIndexedStack.routeName,
      buildRouter: (context) => MyIndexedStack()),
  WidgetPoint(
      name: 'FutureBuilder',
      routeName: MyFutureBuilder.routeName,
      buildRouter: (context) => MyFutureBuilder()),
  WidgetPoint(
      name: 'StreamBuilder',
      routeName: MyStreamBuilder.routeName,
      buildRouter: (context) => MyStreamBuilder()),
];
