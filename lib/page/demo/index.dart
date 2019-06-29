import 'package:flutter_demo/model/widget.dart';
import 'package:flutter_demo/page/demo/demo_two_list.dart';

import 'demo_animation.dart';
import 'demo_build_context.dart';
import 'demo_custom.dart';
import 'demo_hidden_keyboard.dart';
import 'demo_inheritedwidget.dart';
import 'demo_navigator.dart';
import 'demo_network.dart';
import 'demo_night_mode.dart';
import 'demo_notification.dart';
import 'demo_pointer.dart';
import 'demo_scroll_controller.dart';

List<WidgetPoint> demoPoints = [
  WidgetPoint(
      name: '横向两个listview',
      routeName: TwoList.routeName,
      buildRouter: (context) => TwoList()),
  WidgetPoint(
      name: '点击空白处隐藏键盘',
      routeName: HiddenKeyboardTestWidget.routeName,
      buildRouter: (context) => HiddenKeyboardTestWidget()),
  WidgetPoint(
      name: 'ScrollController',
      routeName: MyScrollController.routeName,
      wrapByParent: false,
      buildRouter: (context) => MyScrollController()),
  WidgetPoint(
      name: 'Navigator',
      routeName: MyNavigator.routeName,
      buildRouter: (context) => MyNavigator()),
  WidgetPoint(
      name: 'InheritedWidget',
      routeName: MyInheritedWidget.routeName,
      buildRouter: (context) => MyInheritedWidget()),
  WidgetPoint(
      name: 'BuildContext',
      routeName: BuildContextTestRoute.routeName,
      buildRouter: (context) => BuildContextTestRoute()),
  WidgetPoint(
      name: 'ThemeTest',
      routeName: ThemeTestRoute.routeName,
      buildRouter: (context) => ThemeTestRoute()),
  WidgetPoint(
      name: 'Point',
      routeName: PointTestWidget.routeName,
      buildRouter: (context) => PointTestWidget()),
  WidgetPoint(
      name: 'Route',
      routeName: NotificationTestRoute.routeName,
      buildRouter: (context) => NotificationTestRoute()),
  WidgetPoint(
      name: 'Animation',
      routeName: AnimationTestRoute.routeName,
      wrapByParent: false,
      buildRouter: (context) => AnimationTestRoute()),
  WidgetPoint(
      name: 'CustomPaint',
      wrapByParent: false,
      routeName: MyCustomPaint.routeName,
      buildRouter: (context) => MyCustomPaint()),
  WidgetPoint(
      name: 'Http',
      routeName: HttpTestRoute.routeName,
      buildRouter: (context) => HttpTestRoute()),
];
