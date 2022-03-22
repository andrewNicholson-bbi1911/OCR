import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Core/ForWidgets/request_string_data_builder.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/rec_line_widget.dart';

class RecognitionWordsList extends StatelessWidget{
  final List<String> _lines;
  final RequestStringDataBuilder connectedRecStringDataBuilder;

  late List<RecognisedTextLine> _lineWidgets = [];

  RecognitionWordsList(this._lines, this.connectedRecStringDataBuilder, {Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {

    _lineWidgets = [];
    for(var line in _lines){
      _lineWidgets.add(RecognisedTextLine(line, connectedRecStringDataBuilder ));
    }
    List<Widget> buildingWidgets = [];
    buildingWidgets.addAll(_lineWidgets);

    //что бы при прокрутке не скрывались слова кнопкой поиска
    buildingWidgets.add(const SizedBox(height: 86,));
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppInDevStyle.widgetBGColorWhite,
      ),
      constraints: const BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
             buildingWidgets,
        ),
      )
    );

    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child:
        ListView.separated(
          itemBuilder: (context, index){
            if(index == 0){
              return Container(
              );
            }else if(index == 1){
              return SizedBox(height: 30,);
            }else if(index == 2){
              return const Text(
                "Recognized words",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )
              );
            }else{
                return RecognisedTextLine(_lines[index - 3], connectedRecStringDataBuilder);
            }
          },
          separatorBuilder: (context, index){
            return const Divider(
            );
          },
          itemCount: _lines.length + 3
        )
      )
    );
  }


  void selectAll(){
    for(var line in _lineWidgets){
      line.selectAllWords();
    }
  }

  void deselectAll(){
    for(var line in _lineWidgets){
      line.deselectAllWords();
    }
  }

}