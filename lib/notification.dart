import 'package:flutter/material.dart';

/// Created by cnting on 2023/4/24
///
class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() => _NotificationRouteState();
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // return NotificationListener<MyNotification>(
    //     onNotification: (notification) {
    //       setState(() {
    //         _msg += notification.msg + "";
    //       });
    //       return true;
    //     },
    //     child: Center(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Builder(builder: (context) {
    //             return ElevatedButton(
    //                 onPressed: () => MyNotification("Hi").dispatch(context),
    //                 child: Text("send notification"));
    //           }),
    //           Text(_msg)
    //         ],
    //       ),
    //     ));

    return NotificationListener<MyNotification>(
        onNotification: (notification) {
          print('===>$notification');
          return false;
        },
        child: NotificationListener<MyNotification>(
            onNotification: (notification) {
              setState(() {
                _msg += notification.msg + "";
              });
              return true;
            },
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return ElevatedButton(
                      //按钮点击时分发通知
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ))));
  }
}
