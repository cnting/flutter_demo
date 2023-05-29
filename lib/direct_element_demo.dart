import 'package:flutter/material.dart';

/// Created by cnting on 2023/4/27
/// 直接使用Element创建UI

class HomeView extends ComponentElement {
  HomeView(super.widget);

  String text = "123456789";

  @override
  Widget build() {
    Color primary = Theme.of(this).primaryColor;
    return GestureDetector(
      child: Center(
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(color: primary),
          ),
          onPressed: () {
            var t = text.split("")..shuffle();
            text = t.join();
            markNeedsBuild();
          },
        ),
      ),
    );
  }
}

class CustomHome extends Widget {
  @override
  Element createElement() {
    return HomeView(this);
  }
}
