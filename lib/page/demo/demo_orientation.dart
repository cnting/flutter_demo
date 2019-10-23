import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/routers/routers.dart';

///Created by cnting on 2019/8/22
///切换横屏

class ChangeOrientation extends StatelessWidget {
  static String routeName = '${Routes.demoBase}/orientation';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OrientationBuilder(
        builder: (context, orientation) {
          print('===>当前屏幕:$orientation');
          return RaisedButton(
            child: Text('点击切换横屏'),
            onPressed: () {
              if (MediaQuery.of(context).orientation == Orientation.portrait) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              } else {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              }
            },
          );
        },
      ),
    );
  }
}
