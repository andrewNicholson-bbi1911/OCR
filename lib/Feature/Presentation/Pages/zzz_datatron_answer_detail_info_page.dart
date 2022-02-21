import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';
import 'package:tesseract/Feature/Presentation/Widgets/datatron_response/zzz_datatron_answer_parametr_widget.dart';

class DatatronAnswerDetailInfoPage extends StatelessWidget{
  final RawAnswersEntity _answerData;

  DatatronAnswerDetailInfoPage(this._answerData);

  @override
  Widget build(BuildContext context) {

    final title = (_answerData.labels != null && _answerData.labels!.length > 0) ?
    _answerData.labels![0].toString() : "no title";

    final isReport = _answerData.query == null;

    List<ParametersEntity> paramList = [];
    if(_answerData.parameters != null){
      paramList = _answerData.parameters!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            if(index == 0){
              return Text(
                isReport ? "Report" : "Response",
                style: TextStyle(
                  fontSize: 32,
                  color: isReport ? Colors.amber : Colors.black,
                  fontWeight: FontWeight.w700,

                ),
              );
            }else if(index == 1){
              return Text(
                "more data: " +(isReport
                      ? _answerData.rawResponse.toString()
                      : _answerData.query.toString()),
                  style: TextStyle(
                    fontSize: 12,
                    color: isReport ? Colors.amber : Colors.black,
                 )
                );
            } else if(index == 2) {
              return Container(
                  padding: const EdgeInsets.only(top:10),
                  child: const Text(
                    'Parameters:',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                    )
                  )
              );
            }else{
              return DatatronAnswerParameterWidget(paramList[index -3]);
            }
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 5,
              color: Colors.transparent,
            );
          },
          itemCount: paramList.length + 3)
    );
  }

}