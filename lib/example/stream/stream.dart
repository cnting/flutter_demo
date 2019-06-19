import 'dart:async';

void main() {
  StreamController<int> controller = StreamController<int>();
  controller.stream.transform(transformer).listen((data) => print('===>$data'),
      onError: (err) {
    print(err);
  });
  controller.sink.add(23);
}

final transformer =
    StreamTransformer<int, String>.fromHandlers(handleData: (value, sink) {
  if (value == 100) {
    sink.add("你猜对了");
  } else {
    sink.addError('猜错了');
  }
});
