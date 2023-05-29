import 'package:flutter/material.dart';

/// Created by cnting on 2023/4/24
class AnimatedSwitcherCounterRoute extends StatefulWidget {
  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (child, Animation<double> animation) {
              // return ScaleTransition(
              //   scale: animation,
              //   child: child,
              // );
              var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
              return MySlideTransition(
                position: tween.animate(animation),
                child: child,
              );
            },
            child: Text(
              "$_count",
              key: ValueKey<int>(_count), //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: Text("+1"))
        ],
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  final bool transformHitTests;
  final Widget child;

  const MySlideTransition({
    Key? key,
    required Animation<Offset> position,
    this.transformHitTests = true,
    required this.child,
  }) : super(key: key, listenable: position);

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
