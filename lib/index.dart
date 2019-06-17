import 'model/widget.dart';
import 'page/widget/index.dart' as widgets;
import 'page/demo/index.dart' as demos;

class RouterList {
  List<WidgetPoint> getAllRouters() {
    List<WidgetPoint> list = [];
    list.addAll(widgets.widgetPoints);
    list.addAll(demos.demoPoints);
    return list;
  }
}
