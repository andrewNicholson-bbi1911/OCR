import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/rec_line_widget.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/request_builder_field.dart';

class RecognitionWordsList extends StatelessWidget{
  final List<String> _lines;

  RecognitionWordsList(this._lines):super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child:
        ListView.separated(
          itemBuilder: (context, index){
            if(index == 0){
              return Container(
                  child: RequestBuilderField()
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
                return RecognisedTextLine(_lines[index - 3]);
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

  void _BackToScanning(BuildContext context){
    BlocProvider.of<RecognitionCubit>(context).backToSellecting();
  }
}