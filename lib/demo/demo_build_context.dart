import 'package:flutter/material.dart';

//class BuildContextTestRoute extends StatelessWidget {
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    print('===>当前context：$context,');
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(''),
//      ),
//      body: Center(
//        child: Builder(
//          builder: (context) {
//            return RaisedButton(
//              child: Text('点击'),
//              onPressed: () {
//                Scaffold.of(context).showSnackBar(SnackBar(
//                  content: Text('aaaaa'),
//                ));
//              },
//            );
//          },
//        ),
//      ),
//    );
//  }
//}

//class RaisedButtonWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    print('===>RaisedButtonWidget.context:$context');
//    return RaisedButton(
//      child: Text('点击'),
//      onPressed: () {
//        Scaffold.of(context).showSnackBar(SnackBar(
//          content: Text('bbbbb'),
//        ));
//      },
//    );
//  }
//}

class BuildContextTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyExposingWidget();
  }
}

class MyExposingWidget extends StatefulWidget {
  MyExposingState state;

  @override
  State<StatefulWidget> createState() {
    debugPrint("====>createState()");
    state = MyExposingState();
    return state;
  }

}

class MyExposingState extends State<MyExposingWidget> {
  Color _color = Colors.red;

  Color get color => _color;

  @override
  Widget build(BuildContext context) {
    return MyChildWidget();
  }
}

class MyChildWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final MyExposingWidget widget = context.ancestorWidgetOfExactType(MyExposingWidget);
    final MyExposingState state = widget?.state;

    debugPrint('===>widget:$widget,state:$state');

    return Container(
      color: state==null?Colors.blue:state.color,
    );
  }

}
