import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';
import 'package:reorderables/reorderables.dart';

///Created by cnting on 2019-07-09
///

class MyDraggable extends StatefulWidget {
  static String routeName = '${Routes.widgetBase}/draggable';

  @override
  _MyDraggableState createState() => _MyDraggableState();
}

class _MyDraggableState extends State<MyDraggable> {
  List<String> _items1 = [];
  List<String> _items2 = List<String>.generate(10, (it) => 'item $it');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
              color: Colors.blue[50],
              width: double.infinity,
              child: DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return _createGridView(_items1, Colors.pink[300]);
                },
                onWillAccept: (data) {
                  return !_items1.contains(data);
                },
                onAccept: (String data) {
                  setState(() {
                    _items1.add(data);
                  });
                },
                onLeave: (String data) {
                  setState(() {
                    _items1.remove(data);
                  });
                },
              )),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
        ),
        Expanded(
          child: Container(
              color: Colors.blue[50],
              width: double.infinity,
              child: DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return _createGridView(_items2, Colors.pink[300]);
                },
                onWillAccept: (data) {
                  print('===>onWillAccept');
                  return !_items2.contains(data);
                },
                onAccept: (String data) {
                  print('===>onAccept');
                  setState(() {
                    _items2.add(data);
                  });
                },
                onLeave: (String data) {
                  print('===>onLeave');
                  setState(() {
                    _items2.remove(data);
                  });
                },
              )),
        ),
      ],
    );
  }

  Widget _createGridView(List<String> _items, Color color) {
    List<Widget> children = [];
    for (int index = 0; index < _items.length; index++) {
      Widget child = Container(
        color: color,
        width: 70,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          _items[index],
          style: TextStyle(color: Colors.white),
        ),
      );
      children.add(Draggable<String>(
        onDragCompleted: () {
          print('===>onDragCompleted');
          // 在拖动结束后删除数据
//          setState(() {
//            _items.removeAt(index);
//          });
        },
        childWhenDragging: Opacity(
          opacity: 0.5,
          child: child,
        ),
        feedback: Material(
          child: child,
        ),
        // 当前组件的数据
        data: _items[index],
        child: child,
      ));
    }
    return Wrap(
      children: children,
      spacing: 10,
      runSpacing: 10,
    );
  }
}
