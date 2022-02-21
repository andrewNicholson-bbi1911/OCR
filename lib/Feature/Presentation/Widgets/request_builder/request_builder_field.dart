import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Core/ForWidgets/recognized_word_data.dart';

class RequestBuilderField extends StatefulWidget{

  List<RecognizedWordData> words = [];



  @override
  State<RequestBuilderField> createState() {
    return _RequestBuilderFieldState();
  }


}

class _RequestBuilderFieldState extends State<RequestBuilderField>{\

  List<RecognizedWordData> words = [];

  _RequestBuilderFieldState();

  void UpdateSelectedWords(List<RecognizedWordData> newWords){
    setState(() {
      words = newWords;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppInDevStyle.widgetBGColorWhite,
      ),
      padding: const EdgeInsets.only(left: 24),
      child: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Составьте запрос',
          ),
        style: AppInDevStyle.requestLineTextStyle,

      ),
    );
  }


}