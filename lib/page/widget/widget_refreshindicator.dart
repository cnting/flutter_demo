import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class MyRefreshIndicator extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/refreshindicator';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              //注意这里
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TabBar(
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      text: 'Android',
                    ),
                    Tab(
                      text: 'iOS',
                    ),
                  ],
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              AndroidRefresh(),
              IOSRefresh(),
            ],
          ),
        ));
  }
}

class AndroidRefresh extends StatefulWidget {
  @override
  _AndroidRefreshState createState() => _AndroidRefreshState();
}

class _AndroidRefreshState extends State<AndroidRefresh> {

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: handleRefresh,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('item$index'),
          );
        },
        itemCount: 30,
      ),
    );
  }
}

class IOSRefresh extends StatefulWidget {
  @override
  _IOSRefreshState createState() => _IOSRefreshState();
}

class _IOSRefreshState extends State<IOSRefresh> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<void> handleRefresh() async {}
