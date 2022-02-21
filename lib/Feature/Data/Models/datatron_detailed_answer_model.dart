import 'package:tesseract/Feature/Domain/Entities/datatron_detailed_answer_entity.dart';


class DatatronDetailedAnswerModel extends DatatronDetailedAnswerEntity {

  List<DetailedAnswerDataModel>? answerDataModel;

  DatatronDetailedAnswerModel(
      {this.answerDataModel,
        double? total,
        bool? totalLimit,
        List<List<double?>>? totals
      }) : super(
      data: answerDataModel,
      total: total,
      totalLimit: totalLimit,
      totals: totals
  );


  factory DatatronDetailedAnswerModel.fromJson(Map<String, dynamic> json) {
    var answerDataModel = <DetailedAnswerDataModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) { answerDataModel.add(DetailedAnswerDataModel.fromList((v as List))); });
    }
    var totals = <List<double?>>[];
    if (json['totals'] != null) {
      json['totals'].forEach((v)
      {
        var values = <double?>[];
        v.forEach((val) {
          values.add(double.tryParse(val.toString()));});
      totals.add(values);
      });
    }

    return DatatronDetailedAnswerModel(
      answerDataModel: answerDataModel,
      total: double.tryParse(json['total'].toString()),
      totalLimit: json['totalLimit'],
      totals: totals,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (answerDataModel != null) {
      data['data'] = answerDataModel!.map((v) => v.getAsList()).toList();
    }
    data['total'] = total;
    data['totalLimit'] = totalLimit;
    if (totals != null) {
      data['totals'] = totals!.map(
              (v)
          {
            v.map(
                  (val) => (val)
            ).toList();
          }).toList();
    }
    return data;
  }
}


class DetailedAnswerDataModel extends DetailedAnswerDataEntity {

  DetailedAnswerDataModel({double? num, String? caption}) : super(num: num, caption: caption);

  factory DetailedAnswerDataModel.fromList(List list)
  {
    return DetailedAnswerDataModel(
        num: double.tryParse(list[0].toString()),
        caption: list[1]
    );
  }

  List getAsList(){
    return [num, caption];
  }
}
