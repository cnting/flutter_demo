import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';
import 'package:webview_flutter/webview_flutter.dart';

///Created by cnting on 2019/9/9
///

class MyWebView extends StatefulWidget {
  static String routeName = '${Routes.widgetBase}/webview';

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是标题'),
      ),
      body: WebView(
        initialUrl: 'https://www.baidu.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _completer.complete(controller);
        },
      ),
    );
  }
}
