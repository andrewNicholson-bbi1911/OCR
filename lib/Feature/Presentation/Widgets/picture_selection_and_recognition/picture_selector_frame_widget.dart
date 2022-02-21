import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tesseract/Core/ForWidgets/picture_selector_class.dart';

class PictureSelectorWidget extends StatefulWidget{

  final PictureSelector pictureSelector;
  const PictureSelectorWidget(this.pictureSelector, {Key? key}) : super(key: key);

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
                rightBotPoint: widget.pictureSelector.getRightBotPoint()),

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
      widget.pictureSelector.InitNewSelector(center);
    });
  }

  void _updateTouch(Offset touchPosition){
    setState(() {
      widget.pictureSelector.Update(touchPosition);
    });
  }

}

class SelectionAreaPainter extends CustomPainter{

  final Offset leftTopPoint, rightBotPoint;

  SelectionAreaPainter({this.leftTopPoint = const Offset(20.0,90.0), this.rightBotPoint = const Offset(230.0,20.0)}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..color = Colors.amberAccent
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke;

    final rect = Rect.fromPoints(leftTopPoint, rightBotPoint);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}