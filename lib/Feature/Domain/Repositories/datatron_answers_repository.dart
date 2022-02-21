import 'package:dartz/dartz.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Feature/Data/Models/datatron_detailed_answer_model.dart';
import 'package:tesseract/Feature/Data/Models/datatron_raw_response_model.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';

abstract class DatatronAnswersRepository{

  Future<Either<DatatronRequestFailure, DatatronRawResponseModel>> sendRequest(String requestQuery);
}