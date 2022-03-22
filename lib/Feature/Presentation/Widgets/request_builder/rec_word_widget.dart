import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Core/ForWidgets/recognized_word_data.dart';
import 'package:tesseract/Core/ForWidgets/request_string_data_builder.dart';

class RecognizedWordWidget extends StatefulWidget implements iTurnable{

  bool get wordIsSelected {
    return connectedRequestStringDataBuilder.isSelected(_wordData);
  }

  String get stringValue {
    return _wordData.value;
  }

  late final RecognizedWordData _wordData;

  late VoidCallback _onSelectActionCallback;
  late VoidCallback _onDeselectActionCallback;

  late final RequestStringDataBuilder connectedRequestStringDataBuilder;

  //late State<RecognizedWordWidget> _currentState;

  RecognizedWordWidget({Key? key,
    required String word,
    required RequestStringDataBuilder connectedReqDataBuilder})
      : super(key: key)
  {
    _wordData = RecognizedWordData(value: word);
    connectedRequestStringDataBuilder = connectedReqDataBuilder;
  }

  void setCallbacks(
      VoidCallback onSelectStateActionCallback,
      VoidCallback onDeselectStateActionCallback)
  {
    _onDeselectActionCallback = onDeselectStateActionCallback;
    _onSelectActionCallback = onSelectStateActionCallback;
  }

  void select(){
    connectedRequestStringDataBuilder.addSelectedWord(_wordData);
    _onSelectActionCallback.call();
  }

  void deselect(){
    connectedRequestStringDataBuilder.removeSelectedWord(_wordData);
    _onDeselectActionCallback.call();
  }

  @override
  State<StatefulWidget> createState() => _RecognizedWordWidgetState();


  @override
  void turn(bool on) {

  }

}

class _RecognizedWordWidgetState extends State<RecognizedWordWidget>{

  _RecognizedWordWidgetState() : super();

  @override
  Widget build(BuildContext context) {
    widget.setCallbacks(_setSelected, _setDeselected);

    bool isSelected = widget.wordIsSelected;
    print("rebuild with result $isSelected");
    return GestureDetector(
      onTap: () {
        _tap(isSelected);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 3.0,
            horizontal: 10.0
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppInDevStyle.widgetBGSandBlueColor
              : AppInDevStyle.widgetBGLightGrayColor,
          borderRadius: BorderRadius.circular(8),

        ),
        child: Text(
          widget.stringValue.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? AppInDevStyle.fontColorWhite : AppInDevStyle.fontPageTitleColorGray,
            fontWeight: FontWeight.w400,
            fontFamily: AppInDevStyle.mainFontFamily,
          ),

        )
      )
    );
  }

  void _tap(bool curSelectedStatus){
    var newSelectedStatus = !curSelectedStatus;
    if(newSelectedStatus) {
      widget.select();
    }else{
      widget.deselect();
    }
  }

  void _setSelected(){
    _updateState();
  }

  void _setDeselected(){
    _updateState();
  }

  void _updateState(){
    setState(() {

    });
  }
}
