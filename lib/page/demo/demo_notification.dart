import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

//class NotificationTestRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: NotificationListener<ScrollNotification>(
//        onNotification: (notification) {
//          switch (notification.runtimeType) {
//            case ScrollStartNotification:
//              print('开始滚动');
//              break;
//            case ScrollUpdateNotification:
//              print('正在滚动,${notification.metrics.pixels}');
//              break;
//            case ScrollEndNotification:
//              print('停止滚动');
//              break;
//            case OverscrollNotification:
//              print('滚动到边界');
//              break;
//          }
//          return false;
//        },
//        child: Column(
//          children: <Widget>[
//            Card(
//              child: SizedBox(
//                height: 200,
//                child: Center(child: Text('我是Card')),
//              ),
//            ),
//            Expanded(
//              child: ListView.builder(itemBuilder: (context, index) {
//                return ListTile(
//                  title: Text('ITEM $index'),
//                );
//              }),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}

class NotificationTestRoute extends StatefulWidget {

  static String routeName = "${Routes.demoBase}/notification";

  @override
  State<StatefulWidget> createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<NotificationTestRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<_MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + " ";
        });
        return false;
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(//这里注意
              builder: (context) {
                return RaisedButton(
                  onPressed: () => _MyNotification('Hi').dispatch(context),
                  child: Text('Send Notification'),
                );
              },
            ),
            Text(
              _msg,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class _MyNotification extends Notification {
  final String msg;

  _MyNotification(this.msg);
}
