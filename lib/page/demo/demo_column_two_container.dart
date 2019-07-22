import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class TwoContainer extends StatelessWidget {
  static String routeName = "${Routes.demoBase}/twocontainer";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: Colors.orange,
            height: 200,
          ),
          Flexible(
//            fit: FlexFit.loose,
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
//      child: Container(
//        color: Colors.blue,
//        height: double.infinity,
//      ),
    );
  }
}
