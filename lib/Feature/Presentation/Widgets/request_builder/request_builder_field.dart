import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Core/ForWidgets/recognized_word_data.dart';
import 'package:tesseract/Core/ForWidgets/request_string_data_builder.dart';

class RequestBuilderField extends StatefulWidget{

  final RequestStringDataBuilder requestStringDataBuilder;
  RequestBuilderField({Key? key, required this.requestStringDataBuilder}) : super(key: key){}

  @override
  State<RequestBuilderField> createState() {
    return _RequestBuilderFieldState();
  }

}

class _RequestBuilderFieldState extends State<RequestBuilderField>{

  _RequestBuilderFieldState() : super();
  bool _isEditing = false;


  @override
  Widget build(BuildContext context) {
    var textFromField = TextFormField(
      controller: widget.requestStringDataBuilder.textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Составьте запрос',
        suffixIcon: _isEditing ? null:
          Image.asset('assets/images/icons/edit.png'),
        suffixIconConstraints: _isEditing ? null:
          const BoxConstraints.tightFor(width: 24, height: 24),
      ),
      style: AppInDevStyle.requestLineTextStyle,
      onTap: () => { _setAsEditing()},
      onEditingComplete: () => {_onEditingStopped(context)},
    );


    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppInDevStyle.widgetBGColorWhite,
      ),
      padding: const EdgeInsets.only(left: 24, right:12),
      child: textFromField
    );
  }


  void _setAsEditing(){
    setState(() {
      _isEditing = true;
    });
  }

  void _onEditingStopped(BuildContext context){
    setState(() {
      _isEditing = false;
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    });
  }
}