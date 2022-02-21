import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';
import 'package:tesseract/Feature/Domain/UseCases/get_datatron_responses.dart';
import 'package:tesseract/Feature/Presentation/GettingDatatronResponse_cubit/getting_datatron_response_states.dart';

class GettingDatatronResponseCubit extends Cubit<GettingDatatronResponseState> {

  final GetAllDatatronAnswers _getAllDatatronAnswers;
  late GetAllDatatronAnswersParams _lastParams;

  GettingDatatronResponseCubit(this._getAllDatatronAnswers) : super(GDREmptyState());

  Future<void> getAnswersOnRequest(GetAllDatatronAnswersParams params) async {
    //может вызваться только если мы на начале или задали другой запрос, то есть на составлении запроса
    if(state is GDREmptyState || _lastParams.requestQuery != params.requestQuery) {

      _lastParams = params;

      emit(GDRLoadingState());

      final failureOrResult = await _getAllDatatronAnswers(params);


      failureOrResult.fold(
              (failure) => emit(GDRFailureState(failure)),
              (response) => emit(GDRPresentingState(response)));
    }
    //в противном случае ничего не меняется, вызвать запрос пока нельзя
  }

  void backToRequestBuild(){
    if(state is! GDRLoadingState) {
      emit(GDREmptyState());
    }
  }
}