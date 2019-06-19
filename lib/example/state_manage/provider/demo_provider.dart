import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int value = 0;

  increment() {
    value++;
    notifyListeners();
  }
}

void main() {
  final counter = Counter();
  final textSize = 48;

  ///Provider.value()管理一个不变的数据
  ///ChangeNotifierProvider.value()管理一个可变数据
  runApp(Provider<int>.value(
    value: textSize,
    child: ChangeNotifierProvider.value(
      value: counter,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter redux',
      home: TopScreen(),
    );
  }
}

class TopScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TopScreenState();
  }
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    ///第一种获取方式
    final _counter = Provider.of<Counter>(context);
    final textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        '首页:${_counter.value}',
        style: TextStyle(fontSize: textSize, decoration: TextDecoration.none),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return _SecondScreen();
          }));
        },
        child: Icon(Icons.next_week),
      ),
    );
  }
}

class _SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),

      ///第二种获取方式
      body: Consumer2<Counter, int>(
          builder: (context, Counter counter, int textSize, _) => Center(
                  child: Text(
                '第二页:${counter.value}',
                style: TextStyle(fontSize: textSize.toDouble()),
              ))),
      floatingActionButton: Consumer<Counter>(
          child: Icon(Icons.add), //这里设置child给FloatingActionButton使用
          builder: (context, Counter counter, child) => FloatingActionButton(
                onPressed: () {
                  counter.increment();
                },
                child: child,
              )),
    );
  }
}
