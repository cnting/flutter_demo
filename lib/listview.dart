import 'package:flutter/material.dart';

/// Created by cnting on 2023/5/17
class ListViewRoute extends StatefulWidget {
  @override
  _ListViewRouteState createState() => _ListViewRouteState();
}

class _ListViewRouteState extends State<ListViewRoute> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(title: Text("index:$index")),
      itemCount: 40,
    );
  }
}
