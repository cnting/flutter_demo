import 'model/widget.dart';
import 'page/widget/index.dart' as widgets;

class RouterList {
  List<WidgetPoint> getAllRouters() {
    List<WidgetPoint> list = [];
    list.addAll(widgets.widgetPoints);
    return list;
  }
}
