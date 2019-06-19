import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/page/error.dart';

import '../index.dart';
import 'application.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String widgetBase = '/widget';
  static String demoBase = '/demo';

  static void configureRoutes(Router router) {
    //找不到路由
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return ErrorPage();
    });
    //所有widget
    RouterList().getAllRouters().forEach((demo) {
      Handler handler = Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        bool wrapByParent =
            params['wrapByParent']?.first?.toLowerCase() == 'true' ?? true;
        if (wrapByParent) {
          return Scaffold(
            appBar: AppBar(
              title: Text(demo.name),
            ),
            body: demo.buildRouter(context),
          );
        } else {
          return demo.buildRouter(context);
        }
      });
      router.define(demo.routeName, handler: handler);
    });
  }

  //跳转widget
  static void navigateToWidget(BuildContext context, String routeName,
      {bool wrapByParent = true}) {
    String params = wrapByParent ? '?wrapByParent=$wrapByParent' : '';
    Application.router.navigateTo(context, '$routeName$params',
        transition: TransitionType.inFromRight);
  }
}
