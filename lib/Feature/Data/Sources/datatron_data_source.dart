import 'dart:convert';

import 'package:tesseract/Feature/Data/Models/datatron_detailed_answer_model.dart';
import 'package:tesseract/Feature/Data/Models/datatron_raw_response_model.dart';
import 'package:tesseract/TestData/test_answers_datatron_response.dart';
import 'package:tesseract/TestData/test_datatron_response.dart';

abstract class DatatronDataSource{
  Future<DatatronRawResponseModel> getResponse(String requestQuerry);
  Future<DatatronDetailedAnswerModel> getDetailedAnswerInfoFor(String answerQuery);
}

class DatatronDataSourceImpl extends DatatronDataSource{

  @override
  Future<DatatronRawResponseModel> getResponse(String requestQuerry) async{
    return  Future.delayed(const Duration(milliseconds: 2000))
        .then((_) => DatatronRawResponseModel.fromJson(RawResponsStringData));
  }

  @override
  Future<DatatronDetailedAnswerModel> getDetailedAnswerInfoFor(String answerQuery) async{
    var repo = DetailedAnswerDataRepo();
    var res = repo.getAnswerForQuery(answerQuery)
        .then((repRes) => DatatronDetailedAnswerModel.fromJson(repRes));
    return res;
  }
}
