

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Feature/Domain/Entities/recognition_result_entity.dart';
import 'package:tesseract/Feature/Presentation/Pages/failure_page.dart';
import 'package:tesseract/Feature/Presentation/Pages/loading_page.dart';
import 'package:tesseract/Feature/Presentation/Pages/datatron_request_builder_page.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_states.dart';

import '../fragment_selection_and_recognition_page.dart';

class PictureRecognitionMain extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RecognitionCubit, RecognitionState> (
      builder: (context, state)
      {
        print("state is ${state.toString()}");
        if(state is RecognitionProcessingState){

          return _recognitionProcessingIndicator();

        } else if(state is RecognitionComplitedState){

          var res = state.recognitionResult;
          return _requestBuilder(res);

        } else if(state is RecognitionFailureState){

          return _recognitionError(context);

        }else{

          return _imageSelector();
        }
      }
    );
  }



  Widget _recognitionProcessingIndicator(){
    return LoadingPage(loaderText: "Recognizing");
  }

  Widget _requestBuilder(ImageRecognitionResultEntity recResult){
    return RequestBuilderPage(recResult);
  }

  Widget _recognitionError(BuildContext context){
    return FailurePage(RecognitionFailure());
  }

  Widget _imageSelector(){
    return ImageSelectionSelectorPage();
  }

}
