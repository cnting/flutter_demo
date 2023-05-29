import 'package:flutter/material.dart';

/// Created by cnting on 2023/4/24
class HeroAnimationRouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 40)),
          InkWell(
            child: Hero(
              tag: "avatar",
              child: ClipOval(
                child: Image.asset(
                  "assets/images/rabbit.webp",
                  width: 50,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text('原图'),
                    ),
                    body: HeroAnimationRouteB(),
                  ),
                );
              }));
            },
          )
        ],
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Hero(tag: "avatar",child: Image.asset("assets/images/rabbit.webp"),),);
  }
}

