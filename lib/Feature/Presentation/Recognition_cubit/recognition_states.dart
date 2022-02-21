import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Feature/Domain/Entities/recognition_result_entity.dart';

abstract class RecognitionState{
  RecognitionState();
}

///начало. пользователь выбирает фрагмент
class RecognitionSelectingState extends RecognitionState{

  RecognitionSelectingState() : super();

}

///пользователь уже выбрал и отправил на распознование фрагмент
class RecognitionProcessingState extends RecognitionState{
  RecognitionProcessingState() : super();
}

///распознование завершено, пользователь видит потенциальные запросы
class RecognitionComplitedState extends RecognitionState{
  final ImageRecognitionResultEntity recognitionResult;

  RecognitionComplitedState(this.recognitionResult) : super();
}

///при распозновании произошла ошибка
class RecognitionFailureState extends RecognitionState{
  final Failure failure;

  RecognitionFailureState(this.failure) : super();

}