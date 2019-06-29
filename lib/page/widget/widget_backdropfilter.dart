import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class MyBackdropFilter extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/backdropfilter';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BackdropFilter'),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'normal',
            ),
            Tab(
              text: 'special',
            ),
            Tab(
              text: 'click',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            _BackdropFilter1(),
            _BackdropFilter2(),
            _BackdropFilter3(),
          ],
        ),
      ),
    );
  }
}

class _BackdropFilter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tubangzhu.com/updata/201808/08/08354efc22c8a392c5de.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.1),
            child: Center(
              child: Text(
                '哈哈哈哈哈',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _BackdropFilter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690',
          width: 200,
          height: 200,
        ),
        Stack(
          children: <Widget>[
            Image.network(
              'http://p3.pstatp.com/large/31d900028287e09d896d',
              width: 200,
              height: 200,
            ),
            ClipRect(
              ///注意这里
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.red.withOpacity(0.1),
                  width: 200,
                  height: 200,
                  child: Text('aaaaaaaa'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//TODO 暂未发现问题
class _BackdropFilter3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Center(
                child: RaisedButton(
                  child: Text('测试$index'),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('BackdropFilter下面点击'),
                    ));
                  },
                ),
              );
            },
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: new Container(
              color: Colors.red.withOpacity(0.1),
              child: RaisedButton(
                child: Text('BackdropFilter里面点击'),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('BackdropFilter里面点击'),
                  ));
                },
              ),
            ),
          ),
          Positioned(
            top: 300,
            child: RaisedButton(
              child: Text('BackdropFilter上面点击'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('BackdropFilter上面点击'),
                ));
              },
            ),
          )
//          IgnorePointer(
//            ignoring: true,
//            child: BackdropFilter(
//              filter: ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//              child: new Container(
//                color: Colors.red.withOpacity(0.1),
//                child: RaisedButton(
//                  child: Text('前景点击'),
//                  onPressed: () {
//                    Scaffold.of(context).showSnackBar(SnackBar(
//                      content: Text('前景点击'),
//                    ));
//                  },
//                ),
//              ),
//            ),
//          )
        ],
      ),
    );
  }
}

///https://image.tubangzhu.com/updata/201808/08/08354efc22c8a392c5de.png
///http://p3.pstatp.com/large/31d900028287e09d896d
///https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690
