import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/provider/change_notifier_provider.dart';
import 'package:provider/provider.dart';

/// Created by cnting on 2023/5/29

class UserModel4 with ChangeNotifier {
  String name = "aaa";
  int age = 111;

  void changeName() {
    name = "hello";
    age = 999;
    notifyListeners();
  }
}

class MultiProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel1()),
        ChangeNotifierProvider(create: (_) => UserModel4()),
      ],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel1>(builder: (_, userModel, child) {
              return Text(userModel.name);
            }),
            Consumer<UserModel4>(builder: (_, userModel, child) {
              return Text(userModel.age.toString());
            }),
            Consumer2<UserModel1, UserModel4>(
                builder: (_, userModel1, userModel4, child) {
              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {
                    userModel1.changeName();
                    userModel4.changeName();
                  },
                  child: Text("change"),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
