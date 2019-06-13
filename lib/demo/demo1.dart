import 'package:flutter/material.dart';

class UniversalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print('获取到的参数:$args');
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558608368859&di=0af076d74e61ebba8a31c70277b7d0be&imgtype=0&src=http%3A%2F%2Fs4.sinaimg.cn%2Fmw690%2F005XEeOPgy6XBKzi72H63%26690',
            fit: BoxFit.fitWidth,
          ),
//          Row(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {
                  Navigator.pop(context, "我是第二个页面返回的结果");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
