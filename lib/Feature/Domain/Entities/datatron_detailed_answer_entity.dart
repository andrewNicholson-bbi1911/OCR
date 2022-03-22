
class DatatronDetailedAnswerEntity {

  String get realTotal {
    try{
      var total = totals![0][0]!;
      if(total > 100000000000){
        _extraInfo = "  млрд ₽";
        return (total ~/ 1000000000).toString() + "," + //целая часть
            ((total % 1000000000) ~/ 100000000).toString(); //остаток(1 цифра)
      }else if(total > 10000000){
        _extraInfo = "  млн ₽";
        return (total ~/ 1000000).toString() + "," + //целая часть
            ((total % 1000000) ~/ 100000).toString(); //остаток(1 цифра)
      }else {
        _extraInfo = "  ₽";
        return total.toString().replaceAll(".", ",");
      }
    }catch(e){
      //пока ничего не выводим
      return "";
    }
  }

  String get extraInfo{
    try {
      if (_extraInfo == null) {
        var a = realTotal;
      }
      return _extraInfo!;
    }catch(e){
      return "";
    }
  }
  String? _extraInfo;


  List<DetailedAnswerDataEntity>? data;
  double? total;
  bool? totalLimit;
  List<List<double?>>? totals;


  DatatronDetailedAnswerEntity({this.data, this.total, this.totalLimit, this.totals});

}

class DetailedAnswerDataEntity {
  double? num;
  String? caption;

  DetailedAnswerDataEntity({this.num, this.caption});

}