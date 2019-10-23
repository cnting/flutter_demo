import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

///Created by cnting on 2019-07-30
///IntrinsicWidth可以设置等宽

class MyIntrinsicWidth extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/intrinsicwidth';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //设置child拉伸
            children: <Widget>[
              RaisedButton(
                child: Text('我'),
                onPressed: () {},
              ),
              RaisedButton(child: Text('我我我我我我'), onPressed: () {}),
              RaisedButton(child: Text('我我我我我我我我我我我我'), onPressed: () {}),
            ],
          ),
        ),
        Divider(
          height: 100,
        ),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                //注意没有设置高度
                width: 80,
                color: Colors.red,
              ),
              Container(
                height: 40,
                width: 40,
                color: Colors.blue,
              ),
              Container(
                //注意没有设置高度
                width: 80,
                color: Colors.green,
              ),
            ],
          ),
        )
      ],
    );
  }
}
