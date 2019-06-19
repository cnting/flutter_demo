import 'package:fimber/fimber.dart';

class L {

  static void init() {
    Fimber.plantTree(DebugTree(useColors: true));
  }

  static void i(String msg) {
    Fimber.i(msg);
  }

  static void d(String msg) {
    Fimber.d(msg);
  }

  static void w(String msg) {
    Fimber.w(msg);
  }

  static void e(String msg) {
    Fimber.e(msg);
  }
}
