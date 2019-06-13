import 'package:flutter/material.dart';

import 'package:flutter_demo/layout/layout_listview.dart';
import 'package:flutter_demo/widget/widget_stepper.dart';

class HomeLayoutNavigator extends StatelessWidget {
  Map<String, List<String>> widgets = {
    'C': ['Chip'],
    'S': ['SafeArea', 'Stepper']
  };

  @override
  Widget build(BuildContext context) {
    widgets.forEach((String key,List value){

    });

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: widgets.forEach((String key,List value){})
    );
  }
}

class _ChipsWidget extends StatelessWidget{

  final String _key;
  final List<String> _values;

  _ChipsWidget(this._key,this._values);

  @override
  Widget build(BuildContext context) {

    return null;
  }

}
