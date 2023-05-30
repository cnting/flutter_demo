import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel6 with ChangeNotifier {
  String name = "aaa";
  int age = 10;
  String phone = "123456789";

  void increaseAge() {
    age++;
    notifyListeners();
  }
}

class SelectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModel6>(
      create: (_) => UserModel6(),
      child: Builder(
        builder: (context) {
          return Center(
            child: Selector<UserModel6, int>(
              selector: (_, userModel6) => userModel6.age,
              builder: (_, age, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(age.toString()), child!],
                );
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<UserModel6>(context, listen: false)
                        .increaseAge();
                  },
                  child: Text("add age"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
