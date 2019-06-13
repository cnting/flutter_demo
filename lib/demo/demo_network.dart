import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class HttpTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpTestState();
  }
}

class HttpTestState extends State<HttpTestRoute> {
  String _html = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('获取百度首页'),
          onPressed: () {
            doRequest();
          },
        ),
        Text(
          _html,
          style: TextStyle(fontSize: 12),
        ),
        RaisedButton(
          child: Text('使用Dio'),
          onPressed: () {},
        )
      ],
    );
  }

  void doRequest() async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    setState(() {
      _html = responseBody;
    });
    httpClient.close();
  }
}
