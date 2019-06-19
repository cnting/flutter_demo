import 'package:flutter/cupertino.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child:Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690',
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimationRoute2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimationRouteState();
  }
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  CurvedAnimation curvedAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    //控制动画
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //控制加速器
    curvedAnimation = CurvedAnimation(parent: controller,curve: Curves.bounceInOut);
    //控制范围
    animation = Tween(begin: 0.0, end: 300.0).animate(curvedAnimation);

    //启动动画，正向执行
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(animation:animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

