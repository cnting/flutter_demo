import 'package:flutter/material.dart';

import 'count_bloc.dart';
import 'bloc_provider.dart';

void main() {
  runApp(MyApp());
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
