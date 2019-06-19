import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

///1.创建state
@immutable
class CountState {
  int _count;

  get count => _count;

  CountState(this._count);

  CountState.initState() {
    _count = 0;
  }
}

///2.创建action
enum Action { increment }

///3.创建reducer
CountState reducer(CountState state, action) {
  if (action == Action.increment) {
    return CountState(state.count + 1);
  }
  return state;
}

///4.创建store
void main() {
  final store =
      Store<CountState>(reducer, initialState: CountState.initState());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  Store<CountState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter redux',
        home: TopScreen(),
      ),
    );
  }
}

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    //通过StoreConnector获取值
    return StoreConnector<CountState, int>(
      converter: (store) => store.state.count,
      builder: (context, count) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                count.toString(),
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: Text('点击跳转第二个页面'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SecondScreen();
                  }));
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StoreConnector<CountState, int>(
          builder: (context, count) {
            return Center(
              child: Text('当前总数:$count'),
            );
          },
          converter: (store) => store.state.count),
      floatingActionButton: StoreConnector<CountState, VoidCallback>(
          builder: (context, callback) {
        return FloatingActionButton(
          onPressed: callback,
          child: Icon(Icons.add),
        );
      }, converter: (store) {
        return () => store.dispatch(Action.increment);
      }),
    );
  }
}
