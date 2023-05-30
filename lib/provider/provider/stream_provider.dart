import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Created by cnting on 2023/5/29

class UserModel3 {
  UserModel3({this.name});

  String? name = "aaa";

  void changeName() {
    name = "hello";
  }
}

class UserStream {
  Stream<UserModel3> getStreamUserModel() {
    return Stream<UserModel3>.periodic(
            Duration(milliseconds: 1000), (value) => UserModel3(name: "$value"))
        .take(10);
  }
}

class StreamProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel3>(
      initialData: UserModel3(name: "hello"),
      create: (_) => UserStream().getStreamUserModel(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel3>(builder: (_, userModel, child) {
              return Text(userModel.name ?? "");
            }),
            Consumer<UserModel3>(builder: (_, userModel, child) {
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
