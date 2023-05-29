import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<UserModel>(
              builder: (context, UserModel model, child) {
                return Text(model.name);
              },
            ),
            Consumer(builder: (context, UserModel model, child) {
              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {
                    model.changeName();
                  },
                  child: Text('change'),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class UserModel extends ChangeNotifier{
  String name = "aaa";

  void changeName() {
    name = "hello";
    notifyListeners();
  }
}
