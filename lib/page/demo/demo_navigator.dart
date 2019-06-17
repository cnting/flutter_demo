import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class MyNavigator extends StatelessWidget {

  static String routeName = '${Routes.demoBase}/navigator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[
              Text(
                'page1',
                style: TextStyle(fontSize: 100, color: Colors.black),
              ),
              RaisedButton(
                child: Text('跳转page2'),
                onPressed: () {
                  RouteSettings routeSettings = RouteSettings(name: 'screen1');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return Screen2();
                          },
                          settings: routeSettings));
                },
              )
            ],
          ),
        ));
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          color: Colors.green,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                child: Text(
                  'page2',
                  style: TextStyle(fontSize: 100, color: Colors.black),
                ),
              ),
              RaisedButton(
                child: ListTile(
                  title: Text('pushReplacementNamed()'),
                  subtitle: Text('共三个页面，移除screen2，并跳转到screen3'),
                ),
                onPressed: () {
                  RouteSettings routeSettings = RouteSettings(name: 'screen2');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return Screen3();
                          },
                          settings: routeSettings));
                },
              ),
              RaisedButton(
                child: ListTile(
                  title: Text('pushNamedAndRemoveUntil()'),
                  subtitle: Text('共三个页面，移除screen1,screen2，并跳转到screen3'),
                ),
                onPressed: () {
                  RouteSettings routeSettings = RouteSettings(name: 'screen2');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return Screen3();
                          },
                          settings: routeSettings),
                      (Route route) => false);
                },
              ),
              RaisedButton(
                child: ListTile(
                  title: Text('pushNamedAndRemoveUntil()'),
                  subtitle: Text('共四个页面，移除screen2,screen3，并跳转到screen4'),
                ),
                onPressed: () {
                  RouteSettings routeSettings =
                      RouteSettings(name: 'screen2', arguments: true);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return Screen3(); //先跳screen3
                          },
                          settings: routeSettings));
                },
              ),
            ],
          )),
    );
  }
}

class Screen3 extends StatelessWidget {
  bool toScreen4 = false;

  @override
  Widget build(BuildContext context) {
    toScreen4 = ModalRoute.of(context).settings.arguments ?? false;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue,
        child: toScreen4
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 300,
                    child: Text(
                      'page3',
                      style: TextStyle(fontSize: 100, color: Colors.black),
                    ),
                  ),
                  RaisedButton(
                    child: ListTile(
                      title: Text('pushNamedAndRemoveUntil()'),
                      subtitle: Text('共四个页面，移除screen2,screen3，并跳转到screen4'),
                    ),
                    onPressed: () {
                      RouteSettings settings =
                          new RouteSettings(name: 'screen3');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return Screen4();
                              },
                              settings: settings),ModalRoute.withName(null));  //这里是要保留screen1，name就要填screen1前一个页面的RouteSettings中的name
                    },
                  ),
                  RaisedButton(
                    child: ListTile(
                      title: Text('popUntil()'),
                      subtitle: Text('共三个页面，移除screen2,screen3，并回到screen1'),
                    ),
                    onPressed: () {
                      Navigator.popUntil(
                          context,
                          ModalRoute.withName(null));
                    },
                  ),
                ],
              )
            : Text(
                'page3',
                style: TextStyle(fontSize: 100, color: Colors.black),
              ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.pink,
        child: Text(
          'page4',
          style: TextStyle(fontSize: 100, color: Colors.black),
        ),
      ),
    );
  }
}
