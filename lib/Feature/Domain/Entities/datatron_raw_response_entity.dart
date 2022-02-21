import 'package:tesseract/Feature/Domain/Entities/datatron_detailed_answer_entity.dart';

class DatatronRawResponseEntity {

  List<RawAnswersEntity> get answers{
    try{
      print(data!.search!.answers!.length);
      return data!.search!.answers!;
    }catch(e){
      print(e);
      return[];
    }
  }

  String get sentRequest{
    try{
      return data!.search!.metadata!.question!;
    }catch(e){
      return "no request was sent";
    }
  }

  DataEntity? data;

  DatatronRawResponseEntity({this.data});

}

class DataEntity {
  SearchEntity? search;

  DataEntity({this.search});
}

class SearchEntity {
  MetadataEntity? metadata;
  List<RawAnswersEntity>? answers;

  SearchEntity({this.metadata, this.answers});

}

class MetadataEntity {
  String? uuid;
  String? question;
  int? totalAnswersCount;

  MetadataEntity({this.uuid, this.question, this.totalAnswersCount});

}

class RawAnswersEntity {

  String get answerName{
    try{
      if(isReport){
        return sourceInfo;
      }
      return labels![0];
    }catch(e){
      return "no lables";
    }
  }

  String get sourceInfo{
    try{
      return parameters!.firstWhere((element) => element.type == "resource").values!.first.caption!;
    }catch(e){
      return "no source info";
    }
  }

  bool isReport = false;

  String? query;
  double? relevance;
  String? rawResponse;
  List<String>? data;
  List<String>? labels;
  List<ParametersEntity>? parameters;

  bool isDetailedInfoLoaded = false;

  late DatatronDetailedAnswerEntity detailedAnswer;
  late String reportLink = "";

  RawAnswersEntity(
      {this.query,
        this.relevance,
        this.rawResponse,
        this.data,
        this.labels,
        this.parameters})
  {
    if(query == null && rawResponse != null && rawResponse != "")
      {
        isReport = true;
      }
  }

  void AddDetailedInfo(DatatronDetailedAnswerEntity? detailedAnswer)
  {
    if(detailedAnswer != null){
      this.detailedAnswer = detailedAnswer;
      isDetailedInfoLoaded = true;
    }
  }

  void AddLink(String link){
    reportLink = link;
  }
}

class ParametersEntity {
  String? type;
  String? key;
  String? code;
  String? caption;
  List<ValuesEntity>? values;

  ParametersEntity({this.type, this.key, this.code, this.caption, this.values});
}

class ValuesEntity {
  String? code;
  String? caption;

  ValuesEntity({this.code, this.caption});

}
