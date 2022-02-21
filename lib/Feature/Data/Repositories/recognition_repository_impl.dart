import 'package:dartz/dartz.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Feature/Data/Models/recognition_result_model.dart';
import 'package:tesseract/Feature/Data/Sources/local_image_recognizing_source.dart';
import 'package:tesseract/Feature/Domain/Entities/recognition_result_entity.dart';
import 'package:tesseract/Feature/Domain/Repositories/recognition_repository.dart';

class ImageRecognitionRepositoryImpl extends ImageRecognitionRepository{

  final LocalImageRecognizingSource _localImageRecognizingSource;

  ImageRecognitionRepositoryImpl(this._localImageRecognizingSource);

  @override
  Future<Either<Failure, ImageRecognitionResultModel>> recognizeImageByPath(String path, RecognitionLanguage language) async{
    try {
      final result = await _localImageRecognizingSource.recognizeImage(path, language: language);
      return Right(result);
    }catch(e){
      return Left(RecognitionFailure());
    }
  }
  
}