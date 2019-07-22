import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

///Created by cnting on 2019-07-19
///

class MyInk extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/ink';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              ///按下时整个child的背景
              highlightColor: Colors.red,

              ///波纹颜色
              splashColor: Colors.green,
              child: Container(
                width: 80,
                alignment: Alignment.center,
                height: 80,
                child: Text('Ink'),
              ),
              onTap: () {},
            ),

            ///如果控件想设置背景色，需要使用Ink
            Ink(
              color: Colors.black,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 80,
                  alignment: Alignment.center,
                  height: 80,
                  child: Text(
                    'Ink',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            ///如果控件想设置背景色，需要使用Ink
            Ink(
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(18)),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 80,
                  alignment: Alignment.center,
                  height: 80,
                  child: Text(
                    'Ink',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
