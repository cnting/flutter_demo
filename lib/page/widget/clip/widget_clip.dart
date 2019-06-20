import 'package:flutter/material.dart';
import 'package:flutter_demo/page/widget/clip/page.dart';
import 'package:flutter_demo/page/widget/clip/widget_custom_clip_page.dart';
import 'package:flutter_demo/routers/routers.dart';
import 'dart:math' as Math;
import 'dart:async';
import 'package:flutter_demo/util/log.dart';

class MyClip extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/clip';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clip'),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'ClipOval',
            ),
            Tab(
              text: 'ClipRRect',
            ),
            Tab(
              text: 'ClipRect',
            ),
            Tab(
              text: 'ClipPath',
            ),
            Tab(
              text: 'CustomClip',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            _MyClipOval(),
            _MyClipRRect(),
            _MyClipRect(),
            _MyClipPath(),
            MyCustomClipPage(),
          ],
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}

class _MyClipOval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690",
          fit: BoxFit.fill,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

class _MyClipRRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Image.network(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690",
          fit: BoxFit.fill,
          width: 200,
          height: 150,
        ),
      ),
    );
  }
}

class _MyClipRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        clipper: _MyClipper(),
        child: Image.network(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690",
          fit: BoxFit.fill,
          width: 200,
          height: 150,
        ),
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
//    return Rect.fromCenter(
//        center: Offset(size.width/2, size.height/2), width: 40.0, height: 40.0);
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 40);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class _MyClipPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: _StarCliper(radius: 100),
        child: Image.network(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _StarCliper extends CustomClipper<Path> {
  final double radius;

  _StarCliper({this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (Math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36); // 36为五角星的角度
    double radius_in =
        (radius * Math.sin(radian / 2) / Math.cos(radian)); // 中间五边形的半径

    path.moveTo((radius * Math.cos(radian / 2)), 0.0); // 此点为多边形的起点
    path.lineTo((radius * Math.cos(radian / 2) + radius_in * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) * 2),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo(
        (radius * Math.cos(radian / 2) + radius_in * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius * Math.sin(radian)),
        (radius + radius * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2)), (radius + radius_in));
    path.lineTo((radius * Math.cos(radian / 2) - radius * Math.sin(radian)),
        (radius + radius * Math.cos(radian)));
    path.lineTo(
        (radius * Math.cos(radian / 2) - radius_in * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));

    path.close(); // 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(_StarCliper oldClipper) {
    return this.radius != oldClipper.radius;
  }
}


