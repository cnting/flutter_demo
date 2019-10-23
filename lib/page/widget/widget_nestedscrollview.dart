import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

///Created by cnting on 2019-07-22
/// NestedScrollView和 SliverAppBar结合

class MyNestedScrollView extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/nestedscrollview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text('我是标题'),
                    background: Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550383267899&di=9b9fe57bd7a0bd55c7d673ad449360b1&imgtype=0&src=http%3A%2F%2Fpptdown.pptbz.com%2Fpptbeijing%2F%25E9%2592%25A2%25E9%2593%2581%25E4%25BE%25A0%25E5%25B8%2585%25E6%25B0%2594%25E6%2589%258B%25E7%25BB%2598%25E8%25AE%25BE%25E8%25AE%25A1PPT%25E8%2583%258C%25E6%2599%25AF%25E5%259B%25BE%25E7%2589%2587.jpg",
                      fit: BoxFit.fill,
                    )),
//              floating: true,
//              snap: true,
              ),
            ),
          ];
        },
        body: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverFixedExtentList(
                    itemExtent: 48,
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ListTile(
                        title: Text("Item $index"),
                      );
                    }, childCount: 30),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
