import 'package:dartz/dartz.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Core/UseCase/usecase.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_detailed_answer_entity.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';
import 'package:tesseract/Feature/Domain/Repositories/datatron_answers_repository.dart';

class GetAllDatatronAnswers extends UseCase<DatatronRawResponseEntity, GetAllDatatronAnswersParams>{

  final DatatronAnswersRepository searchRepository;

  GetAllDatatronAnswers(this.searchRepository);

  @override
  Future<Either<DatatronRequestFailure, DatatronRawResponseEntity>> call(GetAllDatatronAnswersParams params) {
    return searchRepository.sendRequest(params.requestQuery);
  }
}

class GetAllDatatronAnswersParams{
  final String requestQuery;
  GetAllDatatronAnswersParams(this.requestQuery);
}

class DetailedDatatronAnswerParams{
  final RawAnswersEntity rawAnswersEntity;
  DetailedDatatronAnswerParams(this.rawAnswersEntity);
}