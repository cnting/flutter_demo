import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../index.dart';
import 'application.dart';

class Routes {
  static String root = "/";
  static String home = "/page.home";
  static String widgetBase = '/page.widget';

  static void configureRoutes(Router router) {
    //找不到路由
//    router.notFoundHandler = Handler(
//        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      showDialog(
//          context: context,
//          builder: (context) => AlertDialog(
//                title: Text('%>_<%'),
//                content: Text('找不到啊找不到'),
//              ));
//      return null;
//    });
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
    Application.router.navigateTo(
        context, '$widgetBase/${widgetName.toLowerCase()}',
        transition: TransitionType.inFromRight);
  }
}
