import 'package:flutter/material.dart';

/// Created by cnting on 2023/4/23
class ValueListenableRoute extends StatefulWidget {
  @override
  _ValueListenableRouteState createState() => _ValueListenableRouteState();
}

class _ValueListenableRouteState extends State<ValueListenableRoute> {
  final ValueNotifier<int> _counter = ValueNotifier(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    print('===>build');
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableBuilder'),
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          builder: (context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child!,
                Text(
                  "$value次",
                  textScaleFactor: textScaleFactor,
                )
              ],
            );
          },
          valueListenable: _counter,
          child: const Text(
            "点击了 ",
            textScaleFactor: textScaleFactor,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
