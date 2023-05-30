import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Created by cnting on 2023/5/29

class UserModel5 with ChangeNotifier {
  String name = "aaa";

  void changeName(String newName) {
    name = newName;
    notifyListeners();
  }
}

class WalletModel {
  UserModel5? userModel5;

  WalletModel({this.userModel5});

  void changeName() {
    userModel5?.changeName("通过代理改变");
  }
}

class ProxyProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModel5>(create: (_) => UserModel5()),
        ProxyProvider<UserModel5, WalletModel>(
            update: (_, userModel5, walletModel) =>
                WalletModel(userModel5: userModel5))
      ],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel5>(builder: (_, userModel, child) {
              return Text(userModel.name);
            }),
            Consumer<UserModel5>(builder: (_, userModel, child) {
              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {
                    userModel.changeName("hello");
                  },
                  child: Text("change"),
                ),
              );
            }),
            Consumer<WalletModel>(builder: (_, walletModel, child) {
              return TextButton(
                  onPressed: () {
                    walletModel.changeName();
                  },
                  child: Text("通过代理改变"));
            })
          ],
        ),
      ),
    );
  }
}
