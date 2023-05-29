// import 'dart:math' as math;
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// /// Created by cnting on 2023/4/25
//
// class WaterMark extends StatefulWidget {
//   final WaterMarkPainter painter;
//   final ImageRepeat repeat;
//
//   const WaterMark({super.key, required this.painter, required this.repeat});
//
//   @override
//   _WaterMarkState createState() => _WaterMarkState();
// }
//
// class _WaterMarkState extends State<WaterMark> {
//   late Future<MemoryImage> _memoryImageFuture;
//
//   @override
//   void initState() {
//     _memoryImageFuture = _getWaterMarkImage();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.expand(
//       child: FutureBuilder(
//         future: _memoryImageFuture,
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState != ConnectionState.done) {
//             return Container();
//           } else {
//             return DecoratedBox(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: snapshot.data,
//                         repeat: widget.repeat,
//                         alignment: Alignment.topLeft)));
//           }
//         },
//       ),
//     );
//   }
//
//   @override
//   void didUpdateWidget(covariant WaterMark oldWidget) {
//     //如果画笔发生了变化，重新绘制水印
//     if (widget.painter.runtimeType != oldWidget.painter.runtimeType ||
//         widget.painter.shouldRepaint(oldWidget.painter)) {
//       //先释放之前的缓存
//       _memoryImageFuture.then((value) => value.evict());
//       _memoryImageFuture = _getWaterMarkImage();
//     }
//     super.didUpdateWidget(oldWidget);
//   }
//
//   //离屏绘制单元水印并将回执结果保存为图片缓存起来
//   Future<MemoryImage> _getWaterMarkImage() async {
//     //创建一个canvas进行离屏缓冲
//     final recorder = PictureRecorder();
//     final canvas = Canvas(recorder);
//     //绘制单元水印并获取其大小
//     final Size size = widget.painter.paintUnit(canvas);
//     final picture = recorder.endRecording();
//     //将单元水印导为图片并缓存起来
//     final img = await picture.toImage(size.width.ceil(), size.height.ceil());
//     final byteData = await img.toByteData(format: ImageByteFormat.png);
//     final pngBytes = byteData!.buffer.asUint8List();
//     return MemoryImage(pngBytes);
//   }
//
//   @override
//   void dispose() {
//     //释放图片缓存
//     _memoryImageFuture.then((value) => value.evict());
//     super.dispose();
//   }
// }
//
// ///定义水印画笔
// abstract class WaterMarkPainter {
//   /// 绘制"单元水印"，完整的水印是由单元水印重复平铺组成,返回值为"单元水印"占用空间的大小。
//   /// [devicePixelRatio]: 因为最终要将绘制内容保存为图片，所以在绘制时需要根据屏幕的
//   /// DPR来放大，以防止失真
//   Size paintUnit(Canvas canvas, double devicePixelRatio);
//
//   ///是否需要重新绘制
//   bool shouldRepaint(covariant WaterMarkPainter oldPainter);
// }
//
// class TextWaterMarkPainter extends WaterMarkPainter {
//   //文本旋转的度数，是角度不是弧度
//   double rotate;
//   TextStyle textStyle;
//   EdgeInsets padding;
//   String text;
//
//   TextWaterMarkPainter({
//     Key? key,
//     double? rotate,
//     EdgeInsets? padding,
//     TextStyle? textStyle,
//     required this.text,
//   })  : assert(rotate == null || rotate >= -90 && rotate <= 90),
//         rotate = rotate ?? 0,
//         padding = padding ?? const EdgeInsets.all(10.0),
//         textStyle = textStyle ??
//             TextStyle(
//               color: Color.fromARGB(20, 0, 0, 0),
//               fontSize: 14,
//             );
//
//   @override
//   Size paintUnit(Canvas canvas, double devicePixelRatio) {
//     TextPainter painter = TextPainter(
//         textDirection: TextDirection.ltr, textScaleFactor: devicePixelRatio);
//     //添加文本和样式
//     painter.text = TextSpan(text: text, style: _textStyle);
//     //对文本进行布局
//     painter.layout();
//     final textWidth = painter.width;
//     final textHeight = painter.height;
//
//     final radians = math.pi * rotate / 180;
//     final orgSin = math.sin(radians);
//     final sin = orgSin.abs();
//     final cos = math.cos(radians).abs();
//
//     final width = textWidth * cos;
//     final height = textWidth * sin;
//
//     painter.paint(canvas, Offset.zero);
//   }
//
//   @override
//   bool shouldRepaint(covariant WaterMarkPainter oldPainter) {
//     // TODO: implement shouldRepaint
//     throw UnimplementedError();
//   }
// }
