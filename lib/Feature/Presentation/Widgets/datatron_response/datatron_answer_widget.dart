import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class DatatronAnswerWidget extends StatelessWidget{

  final RawAnswersEntity _answerEntity;

  DatatronAnswerWidget(this._answerEntity);

  Widget _nameLine(bool isReport, String name){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: Image(
            image: AssetImage(isReport
                ? 'assets/images/datatron_answers_images/report.png'
                : 'assets/images/datatron_answers_images/cube.png'
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
            child: Text(
              name,
              style: AppInDevStyle.datatronAnswerNameTextStyle,
              textAlign: TextAlign.left,
            ),
        )
      ],
    );
  }

}

class DatatronAnswerCubeWidget extends DatatronAnswerWidget{

  //гарантируется, что ответ не отчёт

  DatatronAnswerCubeWidget(RawAnswersEntity answerEntity) : super(answerEntity);

  @override
  Widget build(BuildContext context) {

    var totalData = _answerEntity.detailedAnswer;

    return Container(
      padding: const EdgeInsets.only(left: 16, top:16, right:21, bottom: 16),
      decoration: BoxDecoration(
        color: AppInDevStyle.widgetBGColorWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _accentInfo(totalData.realTotal, totalData.extraInfo),

          const SizedBox(
            height: 16,
          ),
          _nameLine(false, _answerEntity.answerName),
          const SizedBox(
            height: 16,
          ),
          _sourceText(_answerEntity.sourceInfo),
        ],
      ),
    );
  }


  Widget _accentInfo(String mainText, String extraText){
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
          text: TextSpan(
              text: mainText,
              style: AppInDevStyle.datatronAnswerAccentInfoTextStyle,
              children: [
                TextSpan(
                  text: extraText,
                  style: AppInDevStyle.datatronAnswerAccentInfoExtraTextStyle,
                )
              ]
          ),
          textAlign: TextAlign.start,
      ),
    );
  }

  Widget _sourceText(String text){
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: AppInDevStyle.datatronAnswerSourceTextStyle,
        textAlign: TextAlign.start,
      )
    );

  }
}

class DatatronAnswerReportWidget extends DatatronAnswerWidget{

  DatatronAnswerReportWidget(RawAnswersEntity answerEntity) : super(answerEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top:16, right:21, bottom: 16),
      decoration: BoxDecoration(
        color: AppInDevStyle.widgetBGColorWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _nameLine(true, _answerEntity.answerName),
          const SizedBox(height: 16,),
          _toReportButton(),
        ],
      ),
    );
  }

  Widget _toReportButton(){
    return GestureDetector(
      onTap: _openReport,
        child: Container(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "Перейти к отчёту",
            style: AppInDevStyle.datatronAnswerGoToTextStyle,
          ),
          Image.asset('assets/images/icons/arrow.png',
            color: AppInDevStyle.fontColorSandBlue,
            width: 14,
          ),
          ]
        ),
      ),
    );
  }

  void _openReport() async{
    await launch(_answerEntity.reportLink);
  }
}