import 'package:flutter/material.dart';
import 'package:flutter_demo/model/widget.dart';
import 'package:flutter_demo/routers/application.dart';
import 'package:flutter_demo/routers/routers.dart';
import '../widget/index.dart' as widgets;

class HomeLayoutNavigator extends StatelessWidget {
  Map<String, List<WidgetPoint>> category = Map<String, List<WidgetPoint>>();

  HomeLayoutNavigator() {
    widgets.widgetPoints.forEach((e) {
      String key = e.name.substring(0, 1);
      List<WidgetPoint> list = category[key];
      if (list == null) {
        list = [e];
      } else {
        list.add(e);
      }
      list.sort((a, b) => a.routeName.compareTo(b.routeName));
      category[key] = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    category.forEach((_key, _values) {
      widgets.add(_ChipsWidget(_key, _values));
    });

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }
}

class _ChipsWidget extends StatelessWidget {
  final String _key;
  final List<WidgetPoint> _values;

  _ChipsWidget(this._key, this._values);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue[50], Colors.white])),
          width: double.infinity,
          margin: EdgeInsets.only(top: 20),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              _key,
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _values.map((e) {
              return ActionChip(
                avatar: CircleAvatar(
                  child: Text(e.name.substring(0,1)),
                ),
                label: Text(e.name),
                onPressed: () {
                  if (e.name == 'SafeArea') {
                    Routes.navigateToWidget(context, e.routeName,
                        wrapByParent: false);
                  } else {
                    Routes.navigateToWidget(context, e.routeName);
                  }
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
