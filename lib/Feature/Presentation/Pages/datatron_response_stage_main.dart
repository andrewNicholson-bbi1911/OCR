import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';
import 'package:tesseract/Feature/Domain/UseCases/get_datatron_responses.dart';
import 'package:tesseract/Feature/Presentation/GettingDatatronResponse_cubit/getting_datatron_response_cubit.dart';
import 'package:tesseract/Feature/Presentation/GettingDatatronResponse_cubit/getting_datatron_response_states.dart';
import 'package:tesseract/Feature/Presentation/Pages/failure_page.dart';
import 'package:tesseract/Feature/Presentation/Pages/loading_page.dart';

import 'datatron_answer_list_page.dart';

class DatatronResponseMain extends StatelessWidget{
  final String requestQuery;

  DatatronResponseMain(this.requestQuery) : super();

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<GettingDatatronResponseCubit>((context), listen: false)
      .getAnswersOnRequest(GetAllDatatronAnswersParams(requestQuery));

    return BlocBuilder<GettingDatatronResponseCubit, GettingDatatronResponseState>(
        builder: (context, state)
        {
          print("CUBIT(RESP)>>state result is ${state.toString()}");
          if(state is GDRLoadingState){
            return _showResponseLoader();
          }else if(state is GDRPresentingState){
            return _showResponseResults(state.response);
         }else if(state is GDRFailureState){
            return _showResponseFailure(context, state.failure);
        }else{
            return const Center(
              child: Text("nothing is here")
            );
        }
        });
  }

  Widget _showResponseLoader(){
    return LoadingPage(loaderText: "Loading");
  }

  Widget _showResponseResults(DatatronRawResponseEntity responseEntity){
    return DatatronAnswerListPage(responseEntity);
  }

  Widget _showResponseFailure(BuildContext context, DatatronRequestFailure failure){
    return FailurePage(failure);
  }
}