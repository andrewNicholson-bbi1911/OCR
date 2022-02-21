class DetailedAnswerDataRepo{
  final Map<String, Map<String, dynamic>> repository = {
    "{\"datamart\":[\"FINALRECEIPTREGISTER\"],\"rows\":[{\"measure\":\"F_ASFK_FINALRECEIPTREGISTER.AMOUNT\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"F_ASFK_FINALRECEIPTREGISTER.PPONAME\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}" : RawAnswer_0_Data,
    "{\"datamart\":[\"INDMBTNP\"],\"rows\":[{\"measure\":\"F_ASFK_MBTCBS.MBTSUM\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_FK_UFK.BUDGETCODE\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}" : RawAnswer_2_Data,
    "{\"datamart\":[\"INDKVRNP\"],\"rows\":[{\"measure\":\"F_ASFK_EXKVRNP.BAU\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_FK_UFK.BUDGETCODE\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}" : RawAnswer_3_Data,
    "{\"datamart\":[\"OMB\"],\"rows\":[{\"measure\":\"F_OMB_MBT.CASHFLOWBUDMEST\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_OMB_BUDGETS.BUDGNAMESUB\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}" : RawAnswer_4_Data,
    "{\"datamart\":[\"UIS\"],\"rows\":[{\"measure\":\"T_UIS_ALLPURCHTEMP.CONTRACTIMP2019\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_UIS_REGIONS_TEMP.NAME\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}" : RawAnswer_6_Data,
    "{\"datamart\":[\"OBLIGATIONKBSMONTH0503128NP\"],\"rows\":[{\"measure\":\"F_BO_OBLIGATIONNP.APPROVBA\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_BO_OKTMO.REGIONCODE\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}" : RawAnswer_7_Data,
  };

  Future<Map<String, dynamic>> getAnswerForQuery(String query)async{
    if(query.isNotEmpty && query != "") {
      var res = repository[query];
      if(res != null) {
        return Future.delayed(const Duration(milliseconds: 120))
            .then((_) => res);
      }else{
        return <String, dynamic>{};
      }

    }else{
      return <String, dynamic>{};
    }
  }

}

///
///
/// ответы были получены немного изменённым запросом: limt: 10, total: true
///
///
const Map<String, dynamic> RawAnswer_0_Data = {
  "data":[
    [
      530567.6,
      " Алтайский район Республики Хакасия"
    ],
    [
      396447.48,
      " Аскизский район Республики Хакасия"
    ],
    [
      300000,
      " Аскинский муниципальный район Республики Башкортостан"
    ],
    [
      2100700,
      " Балтачевский муниципальный район Республики Башкортостан"
    ],
    [
      12372120,
      " Большемурашкинскмй муниципальный  район Нижегородской области муниципальный район Нижегородской области"
    ],
    [
      5675000,
      " Гафурийский муниципальный  район Республики Башкортостан"
    ],
    [
      17366790,
      " КФ администрации МО \"Всеволожский муниципальный район \" администрация МО \"Всеволожский муниципальный район\" ЛО"
    ],
    [
      5403207,
      " КФ администрации МО \"Всеволожский муниципальный район\" администрация МО \"Всеволожский муниципальный район\" ЛО"
    ],
    [
      1456678993,
      " Калужская область"
    ],
    [
      18347642.03,
      " Легойский наслег"
    ]
  ],
  "total":0,
  "totalLimit":false,
  "totals":[
    [
      2002463473841.27
    ]
  ]
};

const Map<String, dynamic> RawAnswer_1_Data_rep = {

};

const Map<String, dynamic> RawAnswer_2_Data = {
  "data":[
    [
      255286889821,
      "01"
    ],
    [
      99567840100,
      "02"
    ],
    [
      1025277039200,
      "03"
    ],
    [
      52160729743.9,
      "04"
    ],
    [
      16869377800,
      "05"
    ],
    [
      46858262240,
      "06"
    ],
    [
      31200189200,
      "07"
    ],
    [
      101432539800,
      "08"
    ],
    [
      66670889300,
      "09"
    ],
    [
      74914237400,
      "10"
    ]
  ],
  "total":0,
  "totalLimit":false,
  "totals":[
    [
      11963489475521.68
    ]
  ]
};

const Map<String, dynamic> RawAnswer_3_Data = {
  "data":[
    [
      null,
      "0"
    ],
    [
      null,
      "01"
    ],
    [
      null,
      "02"
    ],
    [
      null,
      "03"
    ],
    [
      null,
      "04"
    ],
    [
      null,
      "05"
    ],
    [
      null,
      "06"
    ],
    [
      null,
      "07"
    ],
    [
      null,
      "08"
    ],
    [
      null,
      "09"
    ]
  ],
  "total":0,
  "totalLimit":false,
  "totals":[
    [
      44096276642400
    ]
  ]
};

const Map<String, dynamic> RawAnswer_4_Data = {
  "data":[
    [
      -43524.14,
      "Бюджет Воронежской области"
    ],
    [
      1881700933.72,
      "Бюджет Краснодарского края"
    ],
    [
      10640245770.69,
      "Бюджет Курской области"
    ],
    [
      9159004262.96,
      "Бюджет Ханты-Мансийского автономного округа - Югры"
    ],
    [
      170473841994.04,
      "Краевой бюджет"
    ],
    [
      187213472825.6,
      "Московская область"
    ],
    [
      18696022664.7,
      "Областной бюджет"
    ],
    [
      6258995445.17,
      "Областной бюджет Тверской области"
    ],
    [
      1973470019.82,
      "Окружной бюджет Чукотского автономного округа"
    ],
    [
      1968583157.19,
      "Республиканский бюджет"
    ]
  ],
  "total":0,
  "totalLimit":false,
  "totals":[
    [
      415406829012.82
    ]
  ]
};

const Map<String, dynamic> RawAnswer_5_Data_rep = {

};

const Map<String, dynamic> RawAnswer_6_Data = {
  "data":[
    [
      0,
      "Алтайский край"
    ],
    [
      0,
      "Амурская область"
    ],
    [
      0,
      "Архангельская область"
    ],
    [
      0,
      "Астраханская область"
    ],
    [
      0,
      "Белгородская область"
    ],
    [
      0,
      "Брянская область"
    ],
    [
      0,
      "Владимирская область"
    ],
    [
      0,
      "Волгоградская область"
    ],
    [
      0,
      "Вологодская область"
    ],
    [
      0,
      "Воронежская область"
    ]
  ],
  "total":0,
  "totalLimit":false,
  "totals":[
    [
      0
    ]
  ]
};

const Map<String, dynamic> RawAnswer_7_Data = {
  "data":[
    [
      3389913034203.02,
      "01"
    ],
    [
      656970388338.16,
      "02"
    ],
    [
      1165560551345.93,
      "03"
    ],
    [
      448182725495,
      "04"
    ],
    [
      556474359065.31,
      "05"
    ],
    [
      1671824787748.64,
      "06"
    ],
    [
      937036947537.41,
      "07"
    ],
    [
      1265085553894.5,
      "08"
    ],
    [
      1776892750073.68,
      "09"
    ],
    [
      868210245154.9,
      "10"
    ]
  ],
  "total":0,
  "totalLimit":false,
  "totals":[
    [
      201925378106875.5
    ]
  ]
};