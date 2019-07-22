import 'package:flutter_demo/model/widget.dart';
import 'package:flutter_demo/page/widget/clip/widget_clip.dart';
import 'package:flutter_demo/page/widget/widget_backdropfilter.dart';
import 'package:flutter_demo/page/widget/widget_draggable.dart';
import 'package:flutter_demo/page/widget/widget_indexedstack.dart';
import 'package:flutter_demo/page/widget/widget_ink.dart';
import 'package:flutter_demo/page/widget/widget_overlay.dart';
import 'package:flutter_demo/page/widget/widget_refreshindicator.dart';
import 'package:flutter_demo/page/widget/widget_reorderablelistview.dart';
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
  WidgetPoint(
      name: 'Clip',
      routeName: MyClip.routeName,
      wrapByParent: false,
      buildRouter: (context) => MyClip()),
  WidgetPoint(
      name: 'RefreshIndicator',
      routeName: MyRefreshIndicator.routeName,
      wrapByParent: false,
      buildRouter: (context) => MyRefreshIndicator()),
  WidgetPoint(
      name: 'BackdropFilter',
      routeName: MyBackdropFilter.routeName,
      wrapByParent: false,
      buildRouter: (context) => MyBackdropFilter()),
  WidgetPoint(
      name: 'Draggable',
      routeName: MyDraggable.routeName,
      buildRouter: (context) => MyDraggable()),
  WidgetPoint(
      name: 'ReorderableListView',
      routeName: MyReorderListView.routeName,
      buildRouter: (context) => MyReorderListView()),
  WidgetPoint(
      name: 'Overlay',
      routeName: MyOverlay.routeName,
      buildRouter: (context) => MyOverlay()),
  WidgetPoint(
      name: 'Ink',
      routeName: MyInk.routeName,
      buildRouter: (context) => MyInk()),
];
