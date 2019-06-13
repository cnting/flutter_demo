import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/demo_animation.dart';
import 'package:flutter_demo/demo/demo_build_context.dart';
import 'package:flutter_demo/demo/demo_custom.dart';
import 'package:flutter_demo/demo/demo_inheritedwidget.dart';
import 'package:flutter_demo/demo/demo_navigator.dart';
import 'package:flutter_demo/demo/demo_network.dart';
import 'package:flutter_demo/demo/demo_night_mode.dart';
import 'package:flutter_demo/demo/demo_notification.dart';
import 'package:flutter_demo/demo/demo_pointer.dart';
import 'package:flutter_demo/demo/demo_scroll_controller.dart';

class HomeDemoNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Navigator(
//      key: PageStorageKey('home_demo'),
//      onGenerateRoute: (RouteSettings settings) {
//        WidgetBuilder builder;
//        switch (settings.name) {
//          case '/':
//            builder = (BuildContext context) => _HomeDemo();
//            break;
//          case 'demo1':
//            builder = (context) => UniversalView();
//            break;
//          case 'demo2':
//            builder = (context) => SliverDemo();
//            break;
//          case 'ScrollController':
//            builder = (context) => ScrollControllerTestRoute();
//            break;
//        }
//        return MaterialPageRoute(builder: builder, settings: settings);
//      },
//    );
    return _HomeDemo();
  }
}

class _HomeDemo extends StatelessWidget {
  var items = ['ScrollController', 'Navigator', "InheritedWidget","BuildContext","NightMode","PointerEvent","Notification","Animation","自定义widget","网络请求"];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items.elementAt(index)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                if (index == 0) {
                  return ScrollableRoute();
                } else if (index == 1) {
                  return NavigatorRoute();
                } else if(index==2){
                  return InheritedWidgetTestRoute();
                }else if(index==3){
                  return BuildContextTestRoute();
                }else if(index==4){
                  return ThemeTestRoute();
                }else if(index==5){
                  return PointTestWidget();
                }else if(index==6){
                  return NotificationTestRoute();
                }else if(index==7){
                  return AnimationTestRoute();
                }else if(index==8){
                  return CustomTestRoute();
                }else {
                  return HttpTestRoute();
                }
              }));
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 10,
            color: Colors.black,
          );
        },
        itemCount: items.length);
  }
}
