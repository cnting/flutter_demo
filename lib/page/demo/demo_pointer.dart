import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class PointTestWidget extends StatefulWidget {

  static String routeName = '${Routes.demoBase}/point';

  @override
  State<StatefulWidget> createState() {
    return _PointTestState();
  }
}

class _PointTestState extends State<PointTestWidget> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toogle = false;

  @override
  Widget build(BuildContext context) {
    return Center(
//      child: Text.rich(TextSpan(
//        children: [
//          TextSpan(text: "aaaaaaaaa"),
//          TextSpan(
//              text: "bbbbbbbbb",
//              style: TextStyle(color: _toogle ? Colors.blue : Colors.green),
//              recognizer: _tapGestureRecognizer
//              ..onTap =(){
//                setState(() {
//                  _toogle = !_toogle;
//                });
//              }
//          ),
//        ],
//      )),
    child: Container(
      width: 200,
      height: 200,
      constraints: BoxConstraints.tightFor(width:10,height: 10),
      color: Colors.red,
    ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tapGestureRecognizer.dispose();
  }
}
