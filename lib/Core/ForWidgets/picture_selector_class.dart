import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class PictureSelector
{
  final double modifyRadius = 9.0;

  Offset _leftTopPoint = const Offset(48,487);
  Offset _rightBotPoint = const Offset(380,598);

  Offset getLeftTopPoint() => _leftTopPoint;
  Offset getRightBotPoint() => _rightBotPoint;

  Offset getPicturedLeftTopPoint() => _leftTopPoint * 5.4;
  Offset getPicturedRightBotPoint() => _rightBotPoint * 5.4;

  Offset _initPoint = Offset(0,0);

  Offset _deltaVector = Offset(0,0);
  List<EditingSide> _editingSides = [];

  ModifyingState _modifyingState = ModifyingState.none;


  void updateSelectorByNewTap(Offset newTapPosition){
    var sidesToBeModified = _getFrameSidesAreAbleToBeModified(newTapPosition);
    if(sidesToBeModified.isNotEmpty){
      _setModifyingState(sidesToBeModified, newTapPosition);
    }else{
      _setInitiatingState(newTapPosition);
    }
    print("cur vals is: \n"
        "lt = $_leftTopPoint\n"
        "rb = $_rightBotPoint");
  }

  void update(Offset pointIn){

    if(_modifyingState == ModifyingState.initializing){
      _updateInitializing(pointIn);
    } else if(_modifyingState == ModifyingState.modifying){
      _updateModifying(pointIn);
    }
  }

  void _setInitiatingState(Offset initCenter){
    _initPoint = initCenter;
    _modifyingState = ModifyingState.initializing;
    _initNewSelector(initCenter);
  }

  void _initNewSelector(Offset center){
    _setPoints(center + Offset(-modifyRadius, -modifyRadius)
        , center + Offset(modifyRadius, modifyRadius));
  }

  //в итоге решил сделать так, что при инициализации будет генериться минимальный
  // прямоугольник, включающий всебя первую и последнюю позицию тача инициализации
  void _updateInitializing(Offset tapPosition){

    Offset lt = const Offset(0, 0), rb = const Offset(0, 0);

    if(tapPosition.dx > _initPoint.dx){
      lt = Offset(_initPoint.dx, lt.dy);
      rb = Offset(tapPosition.dx, rb.dy);
    }else{
      rb = Offset(_initPoint.dx, rb.dy);
      lt = Offset(tapPosition.dx, lt.dy);
    }

    if(tapPosition.dy > _initPoint.dy){
      lt = Offset(lt.dx, _initPoint.dy);
      rb = Offset(rb.dx, tapPosition.dy);
    }else{
      rb = Offset(rb.dx, _initPoint.dy);
      lt = Offset(lt.dx, tapPosition.dy);
    }

    _setPoints(lt - Offset(modifyRadius, modifyRadius)
        , rb + Offset(modifyRadius, modifyRadius));
  /*

    if(tapPosition.dx>_rightBotPoint.dx){
      rb = Offset( tapPosition.dx, rb.dy);
    } else if(tapPosition.dx<_leftTopPoint.dx){
      lt = Offset( tapPosition.dx, lt.dy);
    }

    if(tapPosition.dy>_rightBotPoint.dy){
      rb = Offset( rb.dx, tapPosition.dy);
    } else if(tapPosition.dy<_leftTopPoint.dy){
      lt = Offset( lt.dx, tapPosition.dy);
    }

    _setPoints(lt, rb);

   */
  }

  void _setModifyingState(List<EditingSide> editingSides, Offset initTap){
    _modifyingState = ModifyingState.modifying;
    var tapToModifyPointDeltaVector = const Offset(0,0);
    if(editingSides.contains(EditingSide.b)){
      tapToModifyPointDeltaVector += Offset(0, (initTap - _rightBotPoint).dy);
    }else if(editingSides.contains(EditingSide.t)){
      tapToModifyPointDeltaVector += Offset(0, (initTap - _leftTopPoint).dy);
    }

    if(editingSides.contains(EditingSide.r)){
      tapToModifyPointDeltaVector += Offset((initTap - _rightBotPoint).dx, 0);
    }else if(editingSides.contains(EditingSide.l)){
      tapToModifyPointDeltaVector += Offset((initTap - _leftTopPoint).dx, 0);
    }
    _editingSides = editingSides;
    _deltaVector = tapToModifyPointDeltaVector;
  }

  List<EditingSide> _getFrameSidesAreAbleToBeModified(Offset tapOffset){
    List<EditingSide> modifyingSides = [];
    var sqrMRadius = pow(modifyRadius, 2);
    if(_isTapInsideFrameModifyingSector(tapOffset)){

      //такие проверки достаточны тк гарантируется, ещё при инициализации рамки,
      //что расстояние от lt до rb будет >= 2 * modifyRadius по каждой оси
      print("called, ${pow(_leftTopPoint.dx - tapOffset.dx, 2)} "
          "and ${pow(_leftTopPoint.dy - tapOffset.dy, 2)}"
          "and ${sqrMRadius}");
      if(pow(_leftTopPoint.dx - tapOffset.dx, 2) < sqrMRadius){
        modifyingSides.add(EditingSide.l);
      }else if(pow(_rightBotPoint.dx - tapOffset.dx, 2) < sqrMRadius){
        modifyingSides.add(EditingSide.r);
      }

      if(pow(_leftTopPoint.dy - tapOffset.dy, 2) < sqrMRadius){
        modifyingSides.add(EditingSide.t);
      }else if(pow(_rightBotPoint.dy - tapOffset.dy, 2) < sqrMRadius){
        modifyingSides.add(EditingSide.b);
      }
    }

    return modifyingSides;
  }

  void _updateModifying(Offset tapPosition){
    tapPosition -= _deltaVector;
    Offset lt = Offset(_leftTopPoint.dx, _leftTopPoint.dy)
    , rb = Offset(_rightBotPoint.dx, _rightBotPoint.dy);

    if(_editingSides.contains(EditingSide.b)){
      rb = Offset(rb.dx, max(tapPosition.dy, lt.dy + 2 * modifyRadius));
    }else if(_editingSides.contains(EditingSide.t)){
      lt = Offset(lt.dx, min(tapPosition.dy, rb.dy - 2 * modifyRadius));
    }

    if(_editingSides.contains(EditingSide.r)){
      rb = Offset(max(tapPosition.dx, lt.dx + 2 * modifyRadius), rb.dy);
    }else if(_editingSides.contains(EditingSide.l)) {
      lt = Offset(min(tapPosition.dx, rb.dx - 2 * modifyRadius), lt.dy);
    }

    _setPoints(lt, rb);
  }

  void _setPoints(Offset leftTopPoint, Offset rightBotPoint){
    _leftTopPoint = leftTopPoint;
    _rightBotPoint = rightBotPoint;
  }
  bool _isTapInsideFrameModifyingSector(Offset tapOffset){
    //outer sector
    if(tapOffset.dx<_rightBotPoint.dx+modifyRadius
        && tapOffset.dx>_leftTopPoint.dx-modifyRadius
        && tapOffset.dy>_leftTopPoint.dy-modifyRadius
        && tapOffset.dy<_rightBotPoint.dy+modifyRadius)
      {
        //print("first");
        //inner sector
        if(!(tapOffset.dx<_rightBotPoint.dx-modifyRadius
            && tapOffset.dx>_leftTopPoint.dx+modifyRadius
            && tapOffset.dy>_leftTopPoint.dy+modifyRadius
            && tapOffset.dy<_rightBotPoint.dy-modifyRadius))
        {
          //print("second");
          return true;
        }
      }
    return false;
  }
}


enum EditingSide{
  t,
  r,
  b,
  l
}

enum ModifyingState{
  none,
  initializing,
  modifying
}
