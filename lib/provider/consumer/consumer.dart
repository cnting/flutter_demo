import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/consumer/model.dart';
import 'package:provider/provider.dart';

class ConsumerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountNotifier1(),
      child: Consumer<CountNotifier1>(
        builder: (context, CountNotifier1 countNotifier1, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(countNotifier1.count.toString()),
                ElevatedButton(
                    onPressed: () {
                      countNotifier1.increment();
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
