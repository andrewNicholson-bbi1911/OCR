import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Feature/Domain/UseCases/recognize_image.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_states.dart';

class RecognitionCubit extends Cubit<RecognitionState>{

  final RecognizeImage recognizeImage;

  RecognitionCubit(this.recognizeImage) : super(RecognitionSelectingState());


  Future<void> recognizeSelectedImage(RecognizeImageParams recParams) async{
    final curState = state;

    //если стадия выбора сегмента, то отправляем на распознование и ждём
    if(curState is RecognitionSelectingState){
      print("CUBIT >> start recognizing");

      emit(RecognitionProcessingState());
      print("CUBIT >> emitted loading");

      final failureOrRecResult = await recognizeImage(recParams);

      print("CUBIT >> recognized ${failureOrRecResult.toString()}");

      failureOrRecResult.fold(
              (failure) => emit(RecognitionFailureState(failure)),
              (recResult) => emit(RecognitionComplitedState(recResult)));
    }else{
      //в противном случае: пока распознаётся, или таск вызван от туда, откуда
      // его вызвать нельзя, то игнорируем просьбу.
      return;
    }
  }

  void backToSellecting(){
    //если в данный момент распознаётся изображение, то игнорируем команду,
    //пусть дораспознает, тогда пользователь сам всё решит ещё раз
    if(state is RecognitionProcessingState) return;

    //в любом друго случае просто выводим начальный экран.
    print("emitting RecSellecting");
    emit(RecognitionSelectingState());
  }

}