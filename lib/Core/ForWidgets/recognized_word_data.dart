import 'package:flutter/material.dart';

class RecognizedWordData{

  String value = "";

  List<ValueChange> _onValueChanged = [];

  RecognizedWordData({required this.value});

  changeValue(String newValue){
    //если пытаемся заменить на пустой текст, то не меняем
    if(newValue.replaceAll(" ", "") == "")
    {
      return;
    }
    value = newValue;

    for(var callback in _onValueChanged){
      callback.call(value);
    }
  }

  void addOnValueChangedCallback(ValueChange callback){
    if(_onValueChanged.contains(callback)) {
      return;
    }else{
      _onValueChanged.add(callback);
    }
  }

  void removeOnValueChangedCallback(ValueChange callback){
    if(_onValueChanged.contains(callback)) {
      _onValueChanged.remove(callback);
    }else{
      return;
    }
  }
}

typedef ValueChange  = void Function(String newValue);
