import 'package:flutter/material.dart';

/// Created by cnting on 2023/4/25
class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  final BoxDecoration decoration;
  final Widget child;

  const AnimatedDecoratedBox({
    Key? key,
    required this.decoration,
    required this.child,
    Curve curve = Curves.linear,
    required Duration duration,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween? _decorationTween;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decorationTween!.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decorationTween = visitor(_decorationTween, widget.decoration,
        (value) => DecorationTween(begin: value)) as DecorationTween;
  }
}

class AnimatedDecoratedRoute extends StatefulWidget {
  @override
  _AnimatedDecoratedRouteState createState() => _AnimatedDecoratedRouteState();
}

class _AnimatedDecoratedRouteState extends State<AnimatedDecoratedRoute> {
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedDecoratedBox(
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(color: _decorationColor),
          child: TextButton(
            onPressed: () {
              setState(() {
                _decorationColor = Colors.red;
              });
            },
            child: const Text(
              "AnimatedDecoratedBox",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
