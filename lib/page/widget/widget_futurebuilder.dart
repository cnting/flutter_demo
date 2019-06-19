import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/data.dart';
import 'package:flutter_demo/routers/routers.dart';
import 'package:flutter_demo/util/log.dart';

class MyFutureBuilder extends StatefulWidget {
  static String routeName = '${Routes.widgetBase}/futurebuilder';

  @override
  _MyFutureBuilderState createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  //避免rebuild 方式1
  Future future;
//  AsyncMemoizer<List<Data>> _memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();
    future = getDataFromNet();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildFutureBuilder(),
        Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  //看FutureBuilder是否进行没必须的重绘操作
                });
              },
            ))
      ],
    );
  }

  Future<List<Data>> getDataFromNet() async {
    L.d('getDataFromNet()');
    var dio = Dio();
    Response response = await dio.get("http://www.wanandroid.com/tree/json");
    Map<String, dynamic> map = response.data;
    Entity entity = Entity.fromJson(map);
    return entity.data;
  }

  //避免rebuild 方式2
//  Future<List<Data>> getDataFromNet() {
//    return _memoizer.runOnce(() async {
//      L.d('getDataFromNet()');
//      var dio = Dio();
//      Response response = await dio.get("http://www.wanandroid.com/tree/json");
//      Map<String, dynamic> map = response.data;
//      Entity entity = Entity.fromJson(map);
//      return entity.data;
//    });
//  }

  buildFutureBuilder() {
    L.d("buildFutureBuilder");
    return FutureBuilder<List<Data>>(
      builder: (context, AsyncSnapshot<List<Data>> snapshot) {
        L.w("builder内部,snapshot.connectionState:${snapshot.connectionState}");
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.waiting) {
          //判断状态
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('ERROR'),
            );
          } else if (snapshot.hasData) {
            List<Data> list = snapshot.data;
            return RefreshIndicator(
              child: buildListView(context, list),
              onRefresh: refresh,
            );
          }
        }
        return null;
      },
      future: future,
    );
  }

  Future refresh() async {
    setState(() {
      future = getDataFromNet();
    });
  }

  buildListView(BuildContext context, List<Data> list) {
    return new ListView.builder(
      itemBuilder: (context, index) {
        Data bean = list[index];
        StringBuffer str = new StringBuffer();
        for (Data children in bean.children) {
          str.write(children.name + "  ");
        }
        return new ListTile(
          title: new Text(bean.name),
          subtitle: new Text(str.toString()),
          trailing: new IconButton(
              icon: new Icon(
                Icons.navigate_next,
                color: Colors.grey,
              ),
              onPressed: () {}),
        );
      },
      itemCount: list.length,
    );
  }
}
