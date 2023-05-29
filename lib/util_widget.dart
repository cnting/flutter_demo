import 'package:flutter/material.dart';

/// Created by cnting on 2023/4/23
/// 打印constraints
class LayoutLogPrint<T> extends StatelessWidget {
  final Widget child;
  final T tag;

  const LayoutLogPrint(
      {required Key key, required this.tag, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      assert(() {
        print('===>${tag ?? key ?? child}:$constraints');
        return true;
      }());
      return child;
    });
  }
}

class SingleLineFittedBox extends StatelessWidget {
  final Widget child;

  const SingleLineFittedBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return FittedBox(
        child: ConstrainedBox(
          constraints: constraints.copyWith(
              minWidth: constraints.maxWidth, maxWidth: double.infinity),
          child: child,
        ),
      );
    });
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final bool keepAlive;
  final Widget child;

  const KeepAliveWrapper(
      {super.key, this.keepAlive = true, required this.child});

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}

