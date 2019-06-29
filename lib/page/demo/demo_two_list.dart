import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class TwoList extends StatelessWidget {
  static String routeName = "${Routes.demoBase}/twolist";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
//        Flexible(
//          child: Text('aaa'),
//        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return SizedBox(
              child: Text('left $index'),
            );
          },
          shrinkWrap: true,
        ),
//        Flexible(
//          fit: FlexFit.loose,
//          child: ListView.builder(itemBuilder: (context, index) {
//            return Text('left $index');
//          }),
//        ),
//        ConstrainedBox(
//          constraints: BoxConstraints.expand(width: 1),
//          child: ListView.builder(
//            shrinkWrap: true,
//            itemBuilder: (context, index) {
//              return Container(
//                color: Colors.red,
//                child: Text('left $index'),
//              );
//            },
//          ),
//        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text('right $index'),
            );
          }),
        ),
      ],
    );
  }
}
