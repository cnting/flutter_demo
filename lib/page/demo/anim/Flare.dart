import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  FlareActor("assets/animation/flare_flutter_logo_.flr",
        alignment: Alignment.topCenter,
        fit: BoxFit.fill,
        animation: "Placeholder");
  }
}
