import 'package:flutter/material.dart';
import 'package:flutter_demo/util/log.dart';
import 'dart:math' as Math;

//void main() {
//  L.init();
//  runApp(DemoApp());
//}
//
//class DemoApp extends StatefulWidget {
//  @override
//  _DemoAppState createState() => _DemoAppState();
//}
//
//class _DemoAppState extends State<DemoApp> {
//  String data = 'init';
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        body: Scaffold(
//          body: DemoPage('Test', data, 30),
//        ),
//        floatingActionButton: FloatingActionButton(onPressed: () {
//          setState(() {
//            data = 'setState';
//          });
//        }),
//      ),
//    );
//  }
//}
//
//class DemoPage extends StatefulWidget {
//  final String title;
//  final String data;
//  final int count;
//
//  DemoPage(this.title, this.data, this.count){}
//
//  @override
//  _DemoPageState createState() => _DemoPageState(this.data);
//}
//
//class _DemoPageState extends State<DemoPage> {
//  final String data;
//
//  _DemoPageState(this.data){}
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: ListView.builder(
//          itemCount: 30,
//          itemBuilder: (context, index) {
//            return Text(data);
//          }),
//    );
//  }
//}

//void main() {
//  L.init();
//  runApp(new MaterialApp(home: PositionedTiles()));
//}
//
//class PositionedTiles extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => PositionedTilesState();
//}
//
//class PositionedTilesState extends State<PositionedTiles> {
//  List<Widget> tiles = [
////    StatelessColorfulTile(),
////    StatelessColorfulTile(),
//    Padding(
//      key: UniqueKey(),
//      child: StatefulColorfulTile(),
//      padding: EdgeInsets.all(10),
//    ),
//    Padding(
//      key: UniqueKey(),
//      padding: EdgeInsets.all(10),
//      child: StatefulColorfulTile(),
//    ),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Row(children: tiles),
//      floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
//    );
//  }
//
//  swapTiles() {
//    setState(() {
//      tiles.insert(1, tiles.removeAt(0));
//    });
//  }
//}
//
//class StatelessColorfulTile extends StatelessWidget {
//  Color myColor = random();
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        color: myColor, child: Padding(padding: EdgeInsets.all(70.0)));
//  }
//}
//
//class StatefulColorfulTile extends StatefulWidget {
//  StatefulColorfulTile({Key key}) : super(key: key);
//
//  @override
//  State<StatefulWidget> createState() {
//    return ColorfulTileState();
//  }
//}
//
//class ColorfulTileState extends State<StatefulColorfulTile> {
//  Color myColor;
//
//  @override
//  void initState() {
//    super.initState();
//    myColor = random();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        color: myColor,
//        child: Padding(
//          padding: EdgeInsets.all(70.0),
//        ));
//  }
//}
//
//Color random() => Color((Math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
//    .withOpacity(1.0);

