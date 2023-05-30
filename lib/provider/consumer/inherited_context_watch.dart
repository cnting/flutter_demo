import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/consumer/model.dart';
import 'package:provider/provider.dart';

class InheritedContextWatchExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountNotifier1(),
      child: Builder(
        builder: (context) {
          /// 使用 watch监听
          var countNotifier = context.watch<CountNotifier1>();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(countNotifier.count.toString()),
                ElevatedButton(
                    onPressed: () {
                      countNotifier.increment();
                    },
                    child: Text("点击加1"))
              ],
            ),
          );
        },
      ),
    );
  }
}
