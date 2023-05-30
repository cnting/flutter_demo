import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Created by cnting on 2023/5/29

class UserModel2 {
  UserModel2({this.name});

  String? name = "aaa";

  Future<void> changeName() async {
    await Future.delayed(Duration(milliseconds: 2000));
    name = "hello";
  }
}

class UserFuture {
  Future<UserModel2> asyncGetUserModel2() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return UserModel2(name: "获取新的数据");
  }
}

class FutureProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<UserModel2>(
      initialData: UserModel2(name: "hello"),
      create: (_) => UserFuture().asyncGetUserModel2(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel2>(builder: (_, userModel, child) {
              return Text(userModel.name ?? "");
            }),
            Consumer<UserModel2>(builder: (_, userModel, child) {
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
