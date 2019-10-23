// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:chewie/chewie.dart';

/// An example of using the plugin, controlling lifecycle and playback of the
/// video.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';
import 'package:video_player/video_player.dart';

class MyVideoDemo extends StatefulWidget {
  static String routeName = "${Routes.demoBase}/video";

  @override
  State<StatefulWidget> createState() {
    return _MyVideoDemoState();
  }
}

class _MyVideoDemoState extends State<MyVideoDemo> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.network('http://res.uquabc.com/HLS/playlist.m3u8');
//        VideoPlayerController.network('http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8');
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      allowMuting: false,
      //视频播放前view
      placeholder: Container(
        color: Colors.black,
      ),
      //显示在视频和controller中间
      overlay: Opacity(
        opacity: 0.5,
        child: Container(
          color: Colors.green,
          child: Text("我是overlay"),
        ),
      ),
//        customControls: Text('我是customControls')
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chewie(
          controller: chewieController,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 3,
            crossAxisSpacing: 10,
            children: <Widget>[
              RaisedButton(
                child: Text('定位到01:00'),
                onPressed: () {
                  chewieController.seekTo(Duration(minutes: 1));
                },
              ),
              RaisedButton(
                child: Text('显示'),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
