import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/index.dart';
import 'package:flutter_demo/routers/routers.dart';

class HomeDemoNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomeDemo();
  }
}

class _HomeDemo extends StatelessWidget {
  var items = demoPoints;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            onTap: () {
              Routes.navigateToWidget(context,items[index].routeName,wrapByParent: items[index].wrapByParent);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 10,
            color: Colors.black,
          );
        },
        itemCount: items.length);
  }
}
