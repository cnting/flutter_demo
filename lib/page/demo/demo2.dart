import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Demo'),
            background: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            }, childCount: 20),
          ),
        ),
        SliverPersistentHeader(
          delegate: _SliverAppBarDelegate(
            minHeight: 60,
            maxHeight: 180,
            child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.lightGreen[100 * (index % 9)],
              child: Text('list item $index'),
            );
          }, childCount: 50),
        )
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
