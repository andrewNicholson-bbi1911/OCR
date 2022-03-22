import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';

class DatatronRawResponseModel extends DatatronRawResponseEntity {

  DataModel? dataModel;

  DatatronRawResponseModel(this.dataModel) : super(data: dataModel);

  factory DatatronRawResponseModel.fromJson(Map<String, dynamic> json) {
    return DatatronRawResponseModel(json['data'] != null ? DataModel.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (dataModel != null) {
      data['data'] = dataModel!.toJson();
    }
    return data;
  }
}

class DataModel extends DataEntity{

  SearchModel? searchModel;

  DataModel(this.searchModel) : super(search: searchModel);

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(json['search'] != null ? SearchModel.fromJson(json['search']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (searchModel != null) {
      data['search'] = searchModel!.toJson();
    }
    return data;
  }
}

class SearchModel extends SearchEntity{

  MetadataModel? metadataModel;
  List<RawAnswersModel>? rawAnswersModelList;
  SearchModel({
    this.metadataModel,
    this.rawAnswersModelList,
  }): super(
    metadata: metadataModel,
    answers: rawAnswersModelList
  );

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var rawAnswersModelList = <RawAnswersModel>[];
    if (json['answers'] != null) {
      json['answers'].forEach((v) {
        rawAnswersModelList.add(RawAnswersModel.fromJson(v));
      });
    }

    return SearchModel(
      metadataModel: json['metadata'] != null
          ? MetadataModel.fromJson(json['metadata'])
          : null,
      rawAnswersModelList: rawAnswersModelList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (metadataModel != null) {
      data['metadata'] = metadataModel!.toJson();
    }
    if (rawAnswersModelList != null) {
      data['answers'] = rawAnswersModelList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MetadataModel extends MetadataEntity {

  MetadataModel({
    String? uuid,
    String? question,
    int? totalAnswersCount}
    ):
  super(
        uuid: uuid,
        question: question,
        totalAnswersCount: totalAnswersCount
      );

  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return MetadataModel(
      uuid: json['uuid'],
      question: json['question'],
      totalAnswersCount: json['totalAnswersCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uuid'] = uuid;
    data['question'] = question;
    data['totalAnswersCount'] = totalAnswersCount;
    return data;
  }
}

class RawAnswersModel extends RawAnswersEntity{

  List<ParametersModel>? parametersModelList;

  RawAnswersModel(
      {String? query,
        double? relevance,
        String? rawResponse,
        List<String>? data,
        List<String>? labels,
        this.parametersModelList})
  : super(
    query: query,
    relevance: relevance,
    rawResponse: rawResponse,
    data: data,
    labels: labels,
    parameters: parametersModelList
  );

  factory RawAnswersModel.fromJson(Map<String, dynamic> json) {
    var data = <String>[];
    if (json['data'] != null) {
      data = json['data'].cast<String>();
    }

    var parametersModelList = <ParametersModel>[];
    if (json['parameters'] != null) {
      json['parameters'].forEach((v) {
        parametersModelList.add(ParametersModel.fromJson(v));
      });
    }

    return RawAnswersModel(
      query: json['query'],
      relevance: double.tryParse(json['relevance'].toString()),
      rawResponse: json['rawResponse'],
      data: data,
      labels: json['labels'].cast<String>(),
      parametersModelList: parametersModelList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['query'] = query;
    data['relevance'] = relevance;
    data['rawResponse'] = rawResponse;
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['labels'] = labels;
    if (parametersModelList != null) {
      data['parameters'] = parametersModelList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParametersModel extends ParametersEntity {

  List<ValuesModel>? valuesModelList;

  ParametersModel(
      {String? type,
        String? key,
        String? code,
        String? caption,
        this.valuesModelList})
      : super(
    type: type,
    key: key,
    code: code,
    caption: caption,
    values: valuesModelList
  );

  factory ParametersModel.fromJson(Map<String, dynamic> json) {

    var valuesModelList = <ValuesModel>[];
    if (json['values'] != null) {
      json['values'].forEach((v) {
        valuesModelList.add(ValuesModel.fromJson(v));
      });
    }

    return ParametersModel(
      type: json['type'],
      key: json['key'],
      code: json['code'],
      caption: json['caption'],
      valuesModelList: valuesModelList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['key'] = key;
    data['code'] = code;
    data['caption'] = caption;
    if (valuesModelList != null) {
      data['values'] = valuesModelList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ValuesModel extends ValuesEntity {

  ValuesModel({String? code, String? caption}) : super(code: code, caption: caption);

  factory ValuesModel.fromJson(Map<String, dynamic> json) {
    return ValuesModel(
      caption: json['caption'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['caption'] = caption;
    return data;
  }
}
