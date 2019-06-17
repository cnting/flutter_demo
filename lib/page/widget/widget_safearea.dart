import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/routers/routers.dart';

class MySafeArea extends StatelessWidget {
  static String routeName = '${Routes.widgetBase}/safearea';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
//        Align(
//          alignment: Alignment(-1, -1),
//          child: Text('HelloHelloHelloHello'),
//        ),
        SafeArea(
          child: Align(
            alignment: Alignment(-1, -1),
            child: Text('HelloHelloHelloHello'),
          ),
        ),
        SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return SizedBox(
                height: 30,
                child: Text(
                  'Data',
                  style: TextStyle(fontSize: 18),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
