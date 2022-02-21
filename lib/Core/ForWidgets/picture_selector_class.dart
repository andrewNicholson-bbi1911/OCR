import 'dart:math';

import 'package:flutter/cupertino.dart';

class PictureSelector
{
  Offset _leftTopPoint = const Offset(0,0);
  Offset _rightBotPoint = const Offset(0,0);

  Offset getLeftTopPoint() => _leftTopPoint;
  Offset getRightBotPoint() => _rightBotPoint;

  Offset getPicturedLeftTopPoint() => _leftTopPoint * 5.4;
  Offset getPicturedRightBotPoint() => _rightBotPoint * 5.4;

  void InitNewSelector(Offset center){
    SetPoints(center + const Offset(-10, -10), center + const Offset(10, 10));
  }

  void Update(Offset pointIn){
    Offset lt = _leftTopPoint, rb = _rightBotPoint;

    if(pointIn.dx>_rightBotPoint.dx){
      rb = Offset( pointIn.dx, rb.dy);
    } else if(pointIn.dx<_leftTopPoint.dx){
      lt = Offset( pointIn.dx, lt.dy);
    }

    if(pointIn.dy>_rightBotPoint.dy){
      rb = Offset( rb.dx, pointIn.dy);
    } else if(pointIn.dy<_leftTopPoint.dy){
      lt = Offset( lt.dx, pointIn.dy);
    }

    SetPoints(lt, rb);
  }

  void SetPoints(Offset leftTopPoint, Offset rightBotPoint){
    _leftTopPoint = leftTopPoint;
    _rightBotPoint = rightBotPoint;
  }

}