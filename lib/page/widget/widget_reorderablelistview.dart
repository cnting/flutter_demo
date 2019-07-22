import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

///Created by cnting on 2019-07-10
///

class MyReorderListView extends StatefulWidget {
  static String routeName = '${Routes.widgetBase}/reorderlistview';

  @override
  _MyReorderListViewState createState() => _MyReorderListViewState();
}

class _MyReorderListViewState extends State<MyReorderListView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = List.generate(
        13,
        (index) => Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
              key: ValueKey(index),
              child: Center(child: Text('ITEM $index')),
            ));
    return ReorderableListView(
      children: list,
      onReorder: (oldIndex, newIndex) {},
//      scrollDirection: Axis.horizontal,
    );
  }
}
