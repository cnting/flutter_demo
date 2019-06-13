import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/application.dart';
import 'package:flutter_demo/routers/routers.dart';

import 'package:flutter_demo/widget/widget_stepper.dart';

class HomeLayoutNavigator extends StatelessWidget {
  Map<String, List<String>> category = {
    'C': ['Chip'],
    'S': ['SafeArea', 'Stepper']
  };

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
  final List<String> _values;

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
                label: Text(e),
                onPressed: () {
                  Routes.navigateToWidget(context, e);
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
