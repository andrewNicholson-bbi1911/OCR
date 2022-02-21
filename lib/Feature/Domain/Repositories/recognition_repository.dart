import 'package:dartz/dartz.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Feature/Data/Sources/local_image_recognizing_source.dart';
import 'package:tesseract/Feature/Domain/Entities/recognition_result_entity.dart';

abstract class ImageRecognitionRepository{

  Future<Either<Failure, ImageRecognitionResultEntity>> recognizeImageByPath(String path, RecognitionLanguage language);

}