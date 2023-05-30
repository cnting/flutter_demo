import 'package:flutter/material.dart';

import 'provider/consumer/inherited_context_read.dart';
import 'provider/consumer/inherited_context_selector.dart';
import 'provider/consumer/inherited_context_watch.dart';
import 'provider/consumer/selector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Navigator.defaultRouteName: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      title: '任务任务任务',
      color: Colors.blue,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InheritedContextSelectExample(),
    );
  }
}
