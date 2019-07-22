import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

///Created by cnting on 2019-07-15
///Overlay是一个Stack的widget，可以将overlay entry插入到overlay中，使独立的child窗口悬浮于其他widget之上。
///因为Overlay本身使用的是[Stack]布局，所以overlay entry可以使用[Positioned] 或者 [AnimatedPositioned]在overlay中定位自己的位置

class MyOverlay extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/overlay';
  OverlayEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('显示Overlay'),
            onPressed: () {
              buildOverlay(context);
            },
          ),
          RaisedButton(
            child: Text('跳转第二个页面'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MyOverlay2(entry);
              }));
            },
          ),
          RaisedButton(
            child: Text('点击刷新'),
            onPressed: () {
              entry.markNeedsBuild();
            },
          ),
        ],
      ),
    );
  }

  void buildOverlay(BuildContext context) {
    int index = 0;
    entry = OverlayEntry(
        builder: (context) {
          return Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              color: Colors.blue,
              child: Text('看我看我 ${index++}'),
            ),
          );
        },
        //设置是否不透明
        opaque: false);
    Overlay.of(context).insert(entry);
  }
}

class MyOverlay2 extends StatelessWidget {
  OverlayEntry entry;

  MyOverlay2(this.entry);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('我是第二个页面'),
            RaisedButton(
              child: Text('点击删除overlay'),
              onPressed: () {
                entry.remove();
              },
            )
          ],
        ),
      ),
    );
  }
}
