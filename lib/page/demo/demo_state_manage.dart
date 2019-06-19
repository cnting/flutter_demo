import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/state_manage/demo_scope_model.dart';
import 'package:flutter_demo/routers/routers.dart';

class MyStateManageTestWidget extends StatelessWidget {
  static String routeName = "${Routes.demoBase}/state_manage";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            title: Text('状态管理'),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: 'Scope model',
                ),
                Tab(
                  text: 'Notification',
                ),
                Tab(
                  text: 'ScrollPhysic',
                ),
                Tab(
                  text: '嵌套滑动',
                ),
                Tab(
                  text: '嵌套滑动2',
                )
              ],
            )),
        body: TabBarView(
          children: <Widget>[
            ScopedModelTestWidget(),
            ScopedModelTestWidget(),
            ScopedModelTestWidget(),
            ScopedModelTestWidget(),
            ScopedModelTestWidget(),
          ],
        ),
      ),
    );
  }
}

