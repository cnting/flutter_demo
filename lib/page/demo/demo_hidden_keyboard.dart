import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

class HiddenKeyboardTestWidget extends StatelessWidget {
  static String routeName = "${Routes.demoBase}/hidden_keyboard";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: GestureDetector(
          onTap: () {
            //将焦点转移到空焦点-FocusNode()
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Center(
            child: Card(
              margin: EdgeInsets.all(30),
              color: Theme.of(context).primaryColor,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'username', hintText: 'username'),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'password', hintText: 'password'),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.all(10),
                        child: Text('login'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
