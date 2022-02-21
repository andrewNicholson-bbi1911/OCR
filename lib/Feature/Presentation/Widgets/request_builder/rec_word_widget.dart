import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecognizedWordWidget extends StatefulWidget{
  final String _word;

  RecognizedWordWidget(this._word) : super();

  @override
  State<StatefulWidget> createState() => _RecognizedWordWidgetState();

}

class _RecognizedWordWidgetState extends State<RecognizedWordWidget>{
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _select();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 3.0,
            horizontal: 10.0
        ),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.amber
              : Colors.grey,
          borderRadius: BorderRadius.circular(20),

        ),
        child: Text(
          widget._word.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),

        )
      )
    );
  }

  void _select(){
    setState(() {
      _isPressed = !_isPressed;
    });
  }

}