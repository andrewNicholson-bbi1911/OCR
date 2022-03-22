import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Core/ForWidgets/request_string_data_builder.dart';
import 'package:tesseract/Feature/Domain/Entities/recognition_result_entity.dart';
import 'package:tesseract/Feature/Presentation/Pages/stages_main/datatron_response_stage_main.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/bottom_action_bar.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/recognition_words_list.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/request_builder_field.dart';

class RequestBuilderPage extends StatelessWidget{

  final ImageRecognitionResultEntity _recResult;

  late final RequestStringDataBuilder requestStringDataBuilder;
  late final TextEditingController textController;
  late BuildContext _currentContext;

  late RecognitionWordsList recWordListWidget;

  RequestBuilderPage(this._recResult) : super(){
    textController = TextEditingController();
    requestStringDataBuilder = RequestStringDataBuilder(textEditingController: textController);
    recWordListWidget = RecognitionWordsList(_recResult.lines, requestStringDataBuilder);
  }

  @override
  Widget build(BuildContext context) {

    _currentContext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("РЕЗУЛЬТАТЫ СКАНИРОВАНИЯ"),
        titleTextStyle: AppInDevStyle.appBarTitleTextStyle,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppInDevStyle.widgetBGSandBlueColor,
        ),
        backgroundColor: AppInDevStyle.appBarBGColor,
      ),
      extendBody: false,
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 20, bottom: 16),
        child: Column(
          children: [
            RequestBuilderField(requestStringDataBuilder: requestStringDataBuilder),
            const SizedBox(height: 16),
            /*
            Flexible(
                child: Center(
                child: recWordListWidget,
              )
            )
             */
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: recWordListWidget
                  )
                ],
              ),
            )

            //const SizedBox(height: 16),
          ]
        ),
      ),
      backgroundColor: AppInDevStyle.pageBGColorGray,
      floatingActionButton:
      Padding(
      padding: const EdgeInsets.only(bottom: 16.0), //поднимаем кнопку чуть выше
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              _showResults(context);
              },
            backgroundColor: AppInDevStyle.widgetBGSandBlueColor,
            child: Image.asset('assets/images/icons/search_button.png',
              color: AppInDevStyle.widgetBGColorWhite,
              height: 26,
            ),
          )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: RequestBuilderBottomNavigationBar(
        backToScanningCallback: _backToScanning,
        selectAllCallback: _selectAll,
        deselectAllCallback: _deselectAll,
      )
    );
  }

  void _showResults(BuildContext context){
    print("searching ${requestStringDataBuilder.queryString}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DatatronResponseMain(requestStringDataBuilder.queryString),
      ),
    );
  }

  void _selectAll(){
    recWordListWidget.selectAll();
  }
  void _deselectAll(){
    recWordListWidget.deselectAll();
  }
  void _backToScanning(){
    BlocProvider.of<RecognitionCubit>(_currentContext).backToSellecting();
  }
}