import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/consumer/model.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatelessWidget {
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
                Text(Provider.of<CountNotifier1>(context, listen: true)
                    .count
                    .toString()),
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
