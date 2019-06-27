import 'package:flutter/material.dart';
import 'package:flutter_demo/example/state_manage/bloc/bloc_provider.dart';
import 'package:flutter_demo/example/state_manage/bloc/count_bloc.dart';
import 'package:flutter_demo/util/log.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(MyApp());
  L.init();
  test();
}

void test() {
  final subject = ReplaySubject<int>(maxSize: 2);
  subject.add(1);
//  subject.stream.listen((data) => L.d('===>11111 $data')); //可以监听到后面的事件

  subject.add(2);
//  subject.stream.listen((data) => L.d('===>22222 $data')); //可以监听到后面的事件
  subject.add(3);
  subject.stream.listen((data) => L.d('===>33333 $data'));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter redux',
        home: TopScreen(),
      ),
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
  CountBLoc bLoc;

  @override
  Widget build(BuildContext context) {
    bLoc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<int>(
            initialData: 0,
            stream: bLoc.stream,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                '我是首页,点击总数:${snapshot.data}',
                style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
              );
            },
          ),
          Builder(
            builder: (context) {
              return RaisedButton(
                child: Text('点击跳转页面'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return _SecondScreen();
                  }));
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: StreamBuilder<int>(
        initialData: bloc.count,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              Text(snapshot.data.toString()),
              RaisedButton(
                onPressed: () {
                  bloc.increment();
                },
                child: Text('add'),
              )
            ],
          );
        },
        stream: bloc.stream,
      ),
    );
  }
}
