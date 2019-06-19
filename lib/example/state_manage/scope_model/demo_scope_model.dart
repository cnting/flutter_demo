import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(ScopedModelTestWidget());
}

class CountModel extends Model {
  int _count = 0;

  get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ScopedModelTestWidget extends StatelessWidget {
  final CountModel countModel = CountModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel>(
        model: countModel,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('第一个页面'),
            ),
            body: TopScreen(),
          ),
        ));
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
    //第一种获取scope方式
    return ScopedModelDescendant<CountModel>(builder: (context, build, model) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '我是首页,点击总数:${model.count}',
            style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
          ),
          Builder(
            builder: (context) {
              return RaisedButton(
                child: Text('点击跳转页面'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return _ScopedModelTestWidget2();
                  }));
                },
              );
            },
          )
        ],
      );
    });
  }
}

class _ScopedModelTestWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //第二种获取scope方式
    final countModel =
        ScopedModel.of<CountModel>(context, rebuildOnChange: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Column(
        children: <Widget>[
          Text(countModel.count.toString()),
          RaisedButton(
            onPressed: () {
              countModel.increment();
            },
            child: Text('add'),
          )
        ],
      ),
    );
  }
}
