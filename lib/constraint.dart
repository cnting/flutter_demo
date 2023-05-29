import 'package:flutter/material.dart';

/// Created by cnting on 2023/5/18

class TestConstraints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: Container(color: Colors.red, width: 10, height: 10),
    );
  }
}
