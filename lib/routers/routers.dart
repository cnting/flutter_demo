import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../index.dart';
import 'application.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String widgetBase = '/widget';

  static void configureRoutes(Router router) {
//    router.define(home, handler: null)
    //所有widget
    RouterList().getAllRouters().forEach((demo) {
      Handler handler = Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        return Scaffold(
          appBar: AppBar(
            title: Text(demo.name),
          ),
          body: demo.buildRouter(context),
        );
      });
      router.define(demo.routeName, handler: handler);
    });
  }

  //跳转widget
  static void navigateToWidget(BuildContext context, String widgetName) {
    Application.router
        .navigateTo(context, '$widgetBase/${widgetName.toLowerCase()}');
  }
}
