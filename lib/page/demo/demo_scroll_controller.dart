import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class MyScrollController extends StatelessWidget {
  static String routeName = "${Routes.demoBase}/scroll_controller";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            title: Text('ScrollController'),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: 'ScrollController',
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
            _ScrollControllerTestRoute(),
            _ScrollNotificationRoute(),
            _ScrollPhysicsRoute(),
            _ScrollNestRoute(),
            _ScrollNestRoute2(),
          ],
        ),
      ),
    );
  }
}

class _ScrollControllerTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControlerState();
  }
}

class _ScrollControlerState extends State<_ScrollControllerTestRoute> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('ITEM $index'),
          );
        },
        controller: _controller,
        itemCount: 1000,
        itemExtent: 50,
        physics: BouncingScrollPhysics(),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}

class _ScrollNotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollNotificationState();
  }
}

class _ScrollNotificationState extends State<_ScrollNotificationRoute> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels / //获取当前滚动位置，计算滚动百分比
              notification.metrics.maxScrollExtent;
          setState(() {
            _progress = '${(progress * 100).toInt()}%';
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('item $index'),
                );
              },
              itemCount: 100,
              itemExtent: 50,
            ),
            CircleAvatar(
              child: Text(_progress),
            )
          ],
        ),
      ),
    );
  }
}

class _ScrollPhysicsRoute extends StatelessWidget {
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  List data = prefix0.generateWordPairs().take(30).toList();

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      controller: fixedExtentScrollController,
      physics: FixedExtentScrollPhysics(),
      children: data.map((e) {
        return Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  e.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
              )),
        );
      }).toList(),
      itemExtent: 60,
    );
  }
}

class _ScrollNestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[ListList(10, Colors.pink), ListList(20, Colors.blue)],
    );
  }
}

class ListList extends StatelessWidget {
  int length = 0; //列表长度
  Color color; //文字颜色

  ListList(this.length, this.color);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Text(
              'item. $index',
              style: TextStyle(color: color),
            ),
        separatorBuilder: (context, index) => Divider(
              color: color,
            ),
        itemCount: length);
  }
}

class _ScrollNestRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate(
          [ListList(10, Colors.pink)],
        )),
        SliverList(
            delegate: SliverChildListDelegate(
          [ListList(20, Colors.blue)],
        )),
      ],
    );
  }
}
