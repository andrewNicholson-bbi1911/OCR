import 'package:dartz/dartz.dart';
import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Feature/Data/Models/datatron_detailed_answer_model.dart';
import 'package:tesseract/Feature/Data/Models/datatron_raw_response_model.dart';
import 'package:tesseract/Feature/Data/Sources/datatron_data_source.dart';
import 'package:tesseract/Feature/Domain/Repositories/datatron_answers_repository.dart';

class DatatronAnswersRepositoryImpl extends DatatronAnswersRepository{

  final DatatronDataSource _datatronDataSource;

  DatatronAnswersRepositoryImpl(this._datatronDataSource);

  @override
  Future<Either<DatatronRequestFailure, DatatronRawResponseModel>> sendRequest(String requestQuery) async{
    try{
      var res = await _datatronDataSource.getResponse(requestQuery);
      var failedAnswers = <RawAnswersModel>[];
      try {

        if(res.answers.isEmpty){
          return Left(DatatronEmptyResponseFailure(requestQuery));
        }

        for (var answer in res.dataModel!.searchModel!.rawAnswersModelList!)
        {
          //далее подгружаем детальную информацию об ответах, если это не отчёт
          //если отчёт, то создаём ссылку на отчёт.
          if(!answer.isReport) {
            var detailedInfo = await _loadDetailedAnswer(answer);
            print("data goten: $detailedInfo");
            detailedInfo.fold(
              //если подгрузить не удалось и вернулась ошибка, то просто
              // записываем в список отклонённых failedAnswers
              // (потом можно что-нибудь придумать):
                    (failure) {
                      failedAnswers.add(answer);
                },
                //всё ок, информацию получили, теперь её записываем в ответ
                    (detailedInfo) {
                  answer.AddDetailedInfo(detailedInfo);
                });
          }else{
            var builtLink = _buildReportLink(answer);
            builtLink.fold(
                    (l) => answer.AddLink(l.message),
                    (link) => answer.AddLink(link)
            );
          }
        }

      }catch(e){
        return Left(DatatronOtherRequestFailure(message: e.toString()));
      }

      return Right(res);
    }catch(e){
      print(e);
      return Left(DatatronOtherRequestFailure(message: e.toString()));
    }
  }

  //гарантируетя, что передаётся НЕ отчёт
  Future <Either<DatatronRequestFailure, DatatronDetailedAnswerModel>> _loadDetailedAnswer(RawAnswersModel rawAnswerModel) async{
    try{
      if(rawAnswerModel.query != null) {
        var query = rawAnswerModel.query!;
        var reqRes = await _datatronDataSource.getDetailedAnswerInfoFor(query);
        if(reqRes.answerDataModel != null){
          return Right(reqRes);
        }else{
          return Left(DatatronInappropriateResponseFailure());
        }
      }else{
        return Left(DatatronEmptyRequestFailure());
      }
    }catch(e){
      print(e);
      return Left(DatatronOtherRequestFailure(message: e.toString()));
    }
  }

  //гарантируется, что уже передаётся отчёт
  Either<DatatronRequestFailure, String> _buildReportLink(RawAnswersModel answer){
    var repStrData = answer.rawResponse;
    if(repStrData == null || repStrData == ""){
      return Left(DatatronReportDataIsEmptyFailure());
    }
    try {
      repStrData.replaceAll("=", "%3D");
      repStrData.replaceAll("&", "%26");

      var splitData = repStrData.split("/");
      var splitDetData = repStrData.split("?");
      var uuid = splitData[1];
      var version = splitDetData[0];
      var params = splitDetData[1];

      //version не используется
      String res = "http://test.piao.fm.epbs.ru/static-report/web/portal.html#/report?version=PROJECT&type=bi&uuid=$uuid&parameters=$params";
      return Right(res);
    }catch(e){
      return Left(DatatronUnableToBuildReportLinkFailure(repStrData));
    }
  }
}