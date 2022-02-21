import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';
import 'package:tesseract/Feature/Presentation/Pages/picture_recognition_stage_main.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';
import 'package:tesseract/Feature/Presentation/Widgets/datatron_response/datatron_answer_widget.dart';

class DatatronAnswerListPage extends StatelessWidget{

  final DatatronRawResponseEntity _responseEntity;

  DatatronAnswerListPage(this._responseEntity) : super();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("РЕЗУЛЬТАТЫ ПОИСКА"),
        titleTextStyle: AppInDevStyle.appBarTitleTextStyle,
        backgroundColor: AppInDevStyle.appBarBGColor,
        iconTheme: const IconThemeData(
          color: AppInDevStyle.floatButtonBGSandBlueColor,
        )
      ),
      backgroundColor: AppInDevStyle.pageBGColorGray,
      extendBody: true,
      body: ListView.separated(
        padding: const EdgeInsets.only(left:18, top: 18, right:23),
        itemBuilder: (BuildContext context, int index) {
          //предполагается, что список ответов не пуст, в противном случае
          //выведется экран ошибки
          if (index == 0) {
            return _requestMetaData(_responseEntity.sentRequest, _responseEntity.answers.length);
            //return _bolvanka();
          } else {
            var curAnswer = _responseEntity.answers[index - 1];
            //рисуем виджет отёта или куба соответсвенно
            if (curAnswer.isReport) {
              return DatatronAnswerReportWidget(curAnswer);
            }
            else {
              return DatatronAnswerCubeWidget(curAnswer);
            }

          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 16,
            color: Colors.transparent,
          );
        },
        itemCount: _responseEntity.answers.length + 1,
      ),

      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed:() => _backToSellectingStage(context),
          child: const Icon(
            Icons.document_scanner_outlined,
            size: 35,
            color: AppInDevStyle.floatButtonIconWhiteColor,
          ),
          backgroundColor: AppInDevStyle.floatButtonBGSandBlueColor,

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _backToSellectingStage(BuildContext context){
    Navigator.pop(context);
    BlocProvider.of<RecognitionCubit>(context).backToSellecting();
  }
  
  Widget _requestMetaData(String request, int answersCount){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                  "Результаты по запросу:",
                style: AppInDevStyle.resultMetadataTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                  "Всего найдено: $answersCount",
                style: AppInDevStyle.resultMetadataTextStyle,
                textAlign: TextAlign.end,
              )
            )
            ],
          ),
        const SizedBox(height: 8),
        Text(
          request,
          style: AppInDevStyle.resultMetadataRequestTextStyle,
        ),
      ],
    );
  }

  Widget _bolvanka(){
    return Container(
      decoration: BoxDecoration(
        color: AppInDevStyle.widgetBGColorWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 200,
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: Container(
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}