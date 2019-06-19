import 'package:flutter/material.dart';

import 'count_bloc.dart';

class BlocProvider extends InheritedWidget {
  CountBLoc bLoc = CountBLoc();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static CountBLoc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .bLoc;
  }
}
