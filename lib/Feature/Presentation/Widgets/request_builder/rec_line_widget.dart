import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/rec_word_widget.dart';

class RecognisedTextLine extends StatelessWidget{
  final String _line;
  RecognisedTextLine(this._line) : super();

  @override
  Widget build(BuildContext context) {
    final words = _line.split(" ");
    List<Widget> rowChildren = [];
    for(int i = 0; i< words.length; i++){
      if(words[i].isNotEmpty){
        rowChildren.add(RecognizedWordWidget(words[i]));
      }
    }
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5.0,
      runSpacing: 5.0,
      children: rowChildren,
    );
  }


}