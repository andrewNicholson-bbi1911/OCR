import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Core/ForWidgets/picture_selector_class.dart';

class PictureSelectorWidget extends StatefulWidget{

  final PictureSelector pictureSelector;
  final double scaler;
  const PictureSelectorWidget(this.pictureSelector, this.scaler,  {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PictureSelectorWidgetState();
}

class _PictureSelectorWidgetState extends State<PictureSelectorWidget>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: GestureDetector(
        onPanStart: (details) => _firstInit(details.localPosition),
        onPanUpdate: (details) => _updateTouch(details.localPosition),
        child: Center(
          child: CustomPaint(
            painter: SelectionAreaPainter(
                leftTopPoint: widget.pictureSelector.getLeftTopPoint(),
                rightBotPoint: widget.pictureSelector.getRightBotPoint(),
                scaler: widget.scaler,
            ),

            child: Container(
              //color: Colors.transparent,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            )
          )
        )
      )
    );
  }

  void _firstInit(Offset center){
    setState(() {
      widget.pictureSelector.updateSelectorByNewTap(center);
    });
  }

  void _updateTouch(Offset touchPosition){
    setState(() {
      widget.pictureSelector.update(touchPosition);
    });
  }

  void _onEditEnd(){
    print("lt is ${widget.pictureSelector.getLeftTopPoint()}\nrb is ${widget.pictureSelector.getRightBotPoint()}");
  }

}

class SelectionAreaPainter extends CustomPainter{

  static const double maxLineLen = 24;

  final Offset leftTopPoint, rightBotPoint;
  final double scaler;

  SelectionAreaPainter({this.leftTopPoint = const Offset(20.0,90.0), this.rightBotPoint = const Offset(230.0,20.0), this.scaler = 1}) : super();

  @override
  void paint(Canvas canvas, Size size) {

    _drawBG(canvas, size);

    _paintFrame(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  //для экономии затемняю задний фон отрисовкой 4ёх прямоугольников
  void _drawBG(Canvas canvas, Size screenSize){

    var paint = Paint()
      ..color = const Color(0x4D000000)
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromPoints(const Offset(0,0), Offset(screenSize.width, leftTopPoint.dy)), paint);
    canvas.drawRect(Rect.fromPoints(Offset(0,rightBotPoint.dy), Offset(leftTopPoint.dx, leftTopPoint.dy)), paint);
    canvas.drawRect(Rect.fromPoints(Offset(rightBotPoint.dx,rightBotPoint.dy), Offset(screenSize.width, leftTopPoint.dy)), paint);
    canvas.drawRect(Rect.fromPoints(Offset(0,rightBotPoint.dy), Offset(screenSize.width, screenSize.height)), paint);

  }

  void _paintFrame(Canvas canvas){

    final frameAnglePartsPaint = Paint()
      ..color = AppInDevStyle.widgetBGColorWhite
      ..strokeWidth = 11 * scaler
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final framelinePartsPaint = Paint()
      ..color = AppInDevStyle.widgetBGColorWhite
      ..strokeWidth = 6 * scaler
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final frameStrokePaint = Paint()
      ..color = const Color(0x4D2177B7)
      ..strokeWidth = 1 * scaler
      ..style = PaintingStyle.stroke;

    var points = [leftTopPoint, Offset(leftTopPoint.dx, rightBotPoint.dy), rightBotPoint, Offset(rightBotPoint.dx, leftTopPoint.dy)];

    final rect = Rect.fromPoints(leftTopPoint, rightBotPoint);
    canvas.drawRect(rect, frameStrokePaint);

    canvas.drawPoints(PointMode.points, points, frameAnglePartsPaint);

    for(int i = 0; i< points.length; i++){
      var lineVector = (points[(i+1)%points.length] - points[i]);
      var lineLen = min( lineVector.distance / 5, maxLineLen );
      var normalizedLineVector = lineVector/lineVector.distance;
      var centerPoint = points[i] + lineVector * 0.5;

      canvas.drawLine(centerPoint - normalizedLineVector * lineLen * 0.5
          , centerPoint + normalizedLineVector * lineLen * 0.5
          , framelinePartsPaint);
    }

  }
}