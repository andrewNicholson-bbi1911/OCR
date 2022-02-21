import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';

class DatatronAnswerParameterWidget extends StatelessWidget{
  final ParametersEntity _parameterData;
  DatatronAnswerParameterWidget(this._parameterData) : super();

  @override
  Widget build(BuildContext context) {

    List<Widget> _valuesWidgets = [];
    if(_parameterData.values!=null && _parameterData.values!.length > 0){
      for(int i = 0; i< _parameterData.values!.length; i++){
        _valuesWidgets.add(DatatronAnswerParametrValueWidget(_parameterData.values![i]));
      }
    }else{
      _valuesWidgets.add(
        Text("no values")
      );
    }
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            _parameterData.caption.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "CODE: ${_parameterData.code.toString()}",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black26,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "values of parameter:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 5,
          )

        ] + _valuesWidgets
      ),
    );
  }
}


class DatatronAnswerParametrValueWidget extends StatelessWidget{

  final ValuesEntity _valueData;
  DatatronAnswerParametrValueWidget(this._valueData) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0)
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            _valueData.caption.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black45,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 4,),
          Text(
            'CODE: ${_valueData.code.toString()}',
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black26,
            ),
            textAlign: TextAlign.start,
          ),
        ]
      )
    );
  }

}