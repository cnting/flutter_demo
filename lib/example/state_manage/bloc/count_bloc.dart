import 'dart:async';

import 'package:rxdart/rxdart.dart';

class CountBLoc {
  int _count;
  StreamController<int> _countController;
//  BehaviorSubject<int> _subject;   //使用RxDart

  CountBLoc() {
    _count = 0;
    _countController = StreamController.broadcast();
//  _subject = BehaviorSubject<int>();
  }

  Stream<int> get stream => _countController.stream;
//  Stream<int> get stream => _subject.stream;

  int get count => _count;

  void increment() {
    _countController.sink.add(++_count);
//    _subject.sink.add(++_count);
  }

  void dispose() {
    _countController.close();
//  _subject.close();
  }
}
