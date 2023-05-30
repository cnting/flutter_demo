import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/consumer/model.dart';
import 'package:provider/provider.dart';

class InheritedContextReadExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountNotifier1(),
      child: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///read 获取值
                Text(context.read<CountNotifier1>().count.toString()),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CountNotifier1>(context, listen: false)
                          .increment();
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
