import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Created by cnting on 2023/5/29

class UserModel1 with ChangeNotifier {
  String name = "aaa";

  void changeName() {
    name = "hello";
    notifyListeners();
  }
}

class ChangeNotifierProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModel1>(
      create: (_) => UserModel1(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel1>(builder: (_, userModel, child) {
              return Text(userModel.name);
            }),
            Consumer<UserModel1>(builder: (_, userModel, child) {
              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {
                    userModel.changeName();
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
