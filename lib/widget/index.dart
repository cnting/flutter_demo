import 'package:flutter/material.dart';
import 'package:flutter_demo/model/widget.dart';
import 'package:flutter_demo/widget/widget_stepper.dart';

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
      name: 'stepper',
      routeName: MyStepper.routeName,
      buildRouter: (context) => MyStepper())
];
