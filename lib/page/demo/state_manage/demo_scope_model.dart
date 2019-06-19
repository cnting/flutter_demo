import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

///这里跳转第二个页面闪退，成功例子可以看example/state_manage/scope_model/demo_scope_model.dart
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
    return ScopedModel<CountModel>(model: countModel, child: TopScreen());
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
    return WillPopScope(
        child: Column(
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
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        });
  }
}
