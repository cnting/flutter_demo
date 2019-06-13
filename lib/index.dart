import 'model/widget.dart';
import 'widget/index.dart' as widgets;

class RouterList {
  List<WidgetPoint> getAllRouters() {
    List<WidgetPoint> list = [];
    list.addAll(widgets.widgetPoints);
    return list;
  }
}
