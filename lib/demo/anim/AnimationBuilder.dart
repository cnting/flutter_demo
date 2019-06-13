import 'package:flutter/cupertino.dart';

class ScaleAnimationRoute3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimationRouteState();
  }
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute3>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  CurvedAnimation curvedAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    //控制时间
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //控制加速器
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);
    //图片宽高从0到300
    animation = Tween(begin: 0.0, end: 300.0).animate(curvedAnimation);

    //启动动画，正向执行
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      animation: animation,
//      child: Image.network(
//          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690'),
//      builder: (context, child) {
//        return Center(
//          child: Container(
//            child: child,
//            width: animation.value,
//            height: animation.value,
//          ),
//        );
//      },
//    );
    return GrowTransition(
      child: Image.network(
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690'),
      animation: animation,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
