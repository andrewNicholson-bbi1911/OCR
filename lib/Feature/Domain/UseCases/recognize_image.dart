import 'package:dartz/dartz.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Core/UseCase/usecase.dart';
import 'package:tesseract/Feature/Data/Sources/local_image_recognizing_source.dart';
import 'package:tesseract/Feature/Domain/Entities/recognition_result_entity.dart';
import 'package:tesseract/Feature/Domain/Repositories/recognition_repository.dart';

class RecognizeImage extends UseCase<ImageRecognitionResultEntity, RecognizeImageParams>{
  final ImageRecognitionRepository imageRecognitionRepository;

  RecognizeImage(this.imageRecognitionRepository);

  @override
  Future<Either<Failure, ImageRecognitionResultEntity>> call(RecognizeImageParams param){
    return imageRecognitionRepository.recognizeImageByPath(param.imagePath, param.language);
  }
}

class RecognizeImageParams {
  final String imagePath;
  final RecognitionLanguage language;
  RecognizeImageParams(this.imagePath, {this.language = RecognitionLanguage.rus});
}