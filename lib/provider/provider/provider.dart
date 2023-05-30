import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Created by cnting on 2023/5/29

class UserModel {
  String name = "aaa";

  void changeName() {
    name = "hello";
  }
}

class ProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<UserModel>(
      create: (_) => UserModel(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel>(builder: (_, userModel, child) {
              return Text(userModel.name);
            }),
            Consumer<UserModel>(builder: (_, userModel, child) {
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
