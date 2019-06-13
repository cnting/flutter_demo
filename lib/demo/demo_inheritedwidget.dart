import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  int data; //需要在子树中共享的数据

  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

//  static ShareDataWidget of(BuildContext context) {
//    return context.inheritFromWidgetOfExactType(ShareDataWidget);
//  }

  static ShareDataWidget of([BuildContext context, bool rebuild = true]) {
    return (rebuild
        ? context.inheritFromWidgetOfExactType(ShareDataWidget)
        : context.ancestorWidgetOfExactType(ShareDataWidget));
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true，则子树中依赖本widget的子widget的state.didChangeDependencies会被调用
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context, false).data.toString()); //而这个“依赖”指的就是是否使用了父widget中InheritedWidget的数据
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    debugPrint('===>调用didChangeDependencies()');
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedWidgetState();
  }
}

class _InheritedWidgetState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _TestWidget(),
            ),
            RaisedButton(
              key: UniqueKey(),
              child: Text('增加'),
              onPressed: () {
                setState(() {
                  ++count;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
