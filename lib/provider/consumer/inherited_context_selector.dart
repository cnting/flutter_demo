import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/consumer/selector.dart';
import 'package:provider/provider.dart';

class InheritedContextSelectExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserModel6(),
      child: Builder(
        builder: (context) {
          ///使用 select
          var age = context.select((UserModel6 userModel6) => userModel6.age);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(age.toString()),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<UserModel6>(context, listen: false)
                          .increaseAge();
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
