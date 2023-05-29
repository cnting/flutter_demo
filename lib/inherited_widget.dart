import 'dart:collection';

import 'package:flutter/material.dart';

/// Created by cnting on 2023/4/23

class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    return true;
  }
}

class ChangeNotifyProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;

  const ChangeNotifyProvider(
      {Key? key, required this.data, required this.child});

  static T? of<T>(BuildContext context, {bool listen = true}) {
    // final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
                .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget
            as InheritedProvider<T>;
    return provider?.data;
  }

  @override
  _ChangeNotifyProviderState<T> createState() =>
      _ChangeNotifyProviderState<T>();
}

class _ChangeNotifyProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifyProvider<T>> {
  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ChangeNotifyProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(data: widget.data, child: widget.child);
  }
}

class Consumer<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T? value) builder;

  const Consumer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifyProvider.of<T>(context));
  }
}

class Item {
  double price;
  int count;

  Item(this.price, this.count);
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.count * element.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifyProvider<CartModel>(
        data: CartModel(),
        child: Builder(
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<CartModel>(
                    builder: (context, cart) => Text("总价:${cart?.totalPrice}")),
                Builder(builder: (context) {
                  print('===>ElevatedButton build');
                  return ElevatedButton(
                      onPressed: () {
                        ChangeNotifyProvider.of<CartModel>(context,
                                listen: false)
                            ?.add(Item(20, 1));
                      },
                      child: Text("添加商品"));
                })
              ],
            );
          },
        ),
      ),
    );
  }
}
