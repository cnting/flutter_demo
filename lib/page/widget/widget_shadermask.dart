import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class MyShaderMask extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/ShaderMask';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        ShaderMask(
          child: Image.asset('assets/images/seven.png',),
          shaderCallback: (rect) {
            return LinearGradient(colors: [
              Colors.redAccent,
              Colors.yellowAccent,
              Colors.lightBlue,
            ], stops: [
              0,
              0.8,
              1
            ]).createShader(rect);
          },
          blendMode: BlendMode.color,
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1.0,
              colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Image.asset('assets/images/ic_launcher.png'),
        )
      ],
    ));
  }
}
