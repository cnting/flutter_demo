import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class HiddenKeyboardTestWidget extends StatelessWidget {
  static String routeName = "${Routes.demoBase}/hidden_keyboard";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'username', hintText: 'username'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'password', hintText: 'password'),
                  ),
                  Spacer(),
                  RaisedButton(
                    child: Text('login'),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
