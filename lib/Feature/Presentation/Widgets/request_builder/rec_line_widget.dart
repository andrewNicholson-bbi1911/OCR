import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Core/ForWidgets/request_string_data_builder.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/rec_word_widget.dart';

class RecognisedTextLine extends StatelessWidget{
  final String _line;
  final RequestStringDataBuilder connectedStringDataBuilder;

  late List<RecognizedWordWidget> _recWordWidgets = [];

  RecognisedTextLine(this._line, this.connectedStringDataBuilder) : super();

  @override
  Widget build(BuildContext context) {
    final words = _line.split(" ");
    _recWordWidgets = [];
    for(int i = 0; i< words.length; i++){
      if(words[i].isNotEmpty){
        _recWordWidgets.add(RecognizedWordWidget(word: words[i]
            , connectedReqDataBuilder: connectedStringDataBuilder
        ));
      }
    }
    return
      Container(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 20),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10.0,
        runSpacing: 8.0,
        children: _recWordWidgets,
      ),
    );

  }

  void selectAllWords(){
    for(var recWordWidget in _recWordWidgets){
      recWordWidget.select();
    }
  }

  void deselectAllWords(){
    for(var recWordWidget in _recWordWidgets){
      recWordWidget.deselect();
    }
  }

}