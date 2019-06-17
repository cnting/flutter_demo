import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class MyIndexedStack extends StatefulWidget {

  static String routeName = '${Routes.widgetBase}/indexedstack';

  @override
  State<StatefulWidget> createState() {
    return _MyIndexedStackState();
  }
}

class _MyIndexedStackState extends State<MyIndexedStack> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('$curIndex,点击切换'),
          onPressed: () {
            setState(() {
              curIndex = (++curIndex) % 5;
            });
          },
        ),
        IndexedStack(
          index: curIndex,
          children: <Widget>[
            Icon(
              Icons.update,
              size: 40.0,
              color: Color(0xffe91e63),
            ),
            Icon(
              Icons.access_alarm,
              size: 40.0,
              color: Color(0xffe91e63),
            ),
            Icon(
              Icons.add_alarm,
              size: 40.0,
              color: Color(0xffe91e63),
            ),
            Icon(
              Icons.access_time,
              size: 40.0,
              color: Color(0xffe91e63),
            ),
            Icon(
              Icons.alarm_off,
              size: 40.0,
              color: Color(0xffe91e63),
            ),
          ],
        )
      ],
    );

  }
}
