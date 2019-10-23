///Created by cnting on 2019-08-08
///
import 'dart:async';

Future<List<dynamic>> getResolutions() async {
  final Map<String, dynamic> response = await aaaaa();
  List<dynamic> resolutions = response['resolutions'];
  print('===>resolutions:$resolutions');
  return resolutions;
}

Map<String, dynamic> aaaaa() {
  return {
    'resolutions': ['aaa', 'bbb']
  };
}

void main() {
  getResolutions().then((value) {
    print("===>value:$value");
  });
}
