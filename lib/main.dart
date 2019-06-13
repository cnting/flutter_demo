import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/home/home_demo.dart';
import 'package:flutter_demo/home/home_layout.dart';
import 'package:flutter_demo/layout/layout_listview.dart';
import 'shopping.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Navigator.defaultRouteName: (context) => HomePage(),
    '/listview': (context) => RandomWords(),
    '/shopping': (context) =>
        ShoppingList(
          products: <Product>[
            Product(name: 'Eggs'),
            Product(name: 'Flour'),
            Product(name: 'chips')
          ],
        ),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      title: '任务任务任务',
      color: Colors.blue,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  int _selectIndex = 0;
  DateTime _lastPressedAt; //上次点击时间
  final List<Widget> _children = [
    HomeLayoutNavigator(),
    HomeDemoNavigator(),
  ];

  void _onTapped(int index) {
    _tabController.animateTo(index);
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击超过一秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
              builder: (context) =>
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  )),
          title: Text(
            'title',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          elevation: 10,
        ),
        drawer: _drawer,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTapped,
          currentIndex: _selectIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.layers), title: Text('widget')),
            BottomNavigationBarItem(
                icon: Icon(Icons.developer_mode), title: Text('实例')),
          ],
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          children: _children,
        ),
      ),
    );
  }
}

Drawer _drawer = Drawer(
  child: ListView(
    padding: EdgeInsets.zero, //设置Drawer灰色头部
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircleAvatar(
              child: Text('A'),
            ),
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('设置'),
      )
    ],
  ),
);
