import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimationRouteState();
  }
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
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
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    //图片宽高从0到300
    animation = Tween(begin: 0.0, end: 300.0).animate(curvedAnimation)
      ..addListener(() {
        setState(() {}); //使build()调用
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          //动画执行结束时反向执行动画
          controller.reverse();
        } else if(status==AnimationStatus.dismissed){
          //动画恢复到初始状态时执行动画（正向）
          controller.forward();
        }
      });
    //启动动画，正向执行
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690',
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
