///Created by cnting on 2019/9/12
///
///
import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class MySliver extends StatefulWidget {
  static String routeName = "${Routes.demoBase}/sliver";
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<MySliver> {
  static final double _initialToolbarHeight = 300;
  static final double _maxSizeFactor = 1.3; // image max size will 130%
  static final double _transformSpeed = 0.001; // 0.1 very fast,   0.001 slow

  ScrollController _controller;
  double _factor = 1;
  double _expandedToolbarHeight = _initialToolbarHeight;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset < 0) {
      _factor = 1 + _controller.offset.abs() * _transformSpeed;
      _factor = _factor.clamp(1, _maxSizeFactor);
      _expandedToolbarHeight = _initialToolbarHeight + _controller.offset.abs(); //
    } else {
      _factor = 1;
      _expandedToolbarHeight = _initialToolbarHeight; //
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: _controller,
      slivers: [
        SliverPersistentHeader(
          floating: false,
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 300,
            maxHeight: 300,
            child: Transform.scale(
              scale: _factor,
              child: Image.network('https://picsum.photos/id/1025/990/660', fit: BoxFit.cover),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(getItems()),
        )
      ],
    );
  }

  getItems() {
    return List.generate(50, (pos) {
      return Container(
        height: 64,
        child: Text('item $pos'),
      );
    });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
