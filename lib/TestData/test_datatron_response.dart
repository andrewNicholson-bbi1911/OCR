
const Map<String, dynamic> RawResponsStringData = {
  "data":{
    "search":{
      "metadata":{
        "uuid":"63c2434c-6e4a-468d-bb25-49738047c360",
        "question":"Аксцизы",
        "totalAnswersCount":8
      },
      "answers":[
        {
          "query":"{\"datamart\":[\"FINALRECEIPTREGISTER\"],\"rows\":[{\"measure\":\"F_ASFK_FINALRECEIPTREGISTER.AMOUNT\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"F_ASFK_FINALRECEIPTREGISTER.PPONAME\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}",
          "relevance":2.199932,
          "rawResponse":null,
          "data":[

          ],
          "labels":[
            "Фактически перечислено",
            "Наименование ППО"
          ],
          "parameters":[
            {
              "type":"resource",
              "key":"resource",
              "code":null,
              "caption":"Ресурс",
              "values":[
                {
                  "code":"FINALRECEIPTREGISTER",
                  "caption":"Реестр конечных получателей субсидий"
                }
              ]
            },
            {
              "type":"attribute",
              "key":"[FINALRECEIPTREGISTER].[F_ASFK_FINALRECEIPTREGISTER]",
              "code":"F_ASFK_FINALRECEIPTREGISTER",
              "caption":"Реестр конечных получателей субсидий",
              "values":[
                {
                  "code":"F_ASFK_FINALRECEIPTREGISTER.PPONAME",
                  "caption":"Наименование ППО"
                }
              ]
            },
            {
              "type":"measure",
              "key":"[FINALRECEIPTREGISTER].[Measures].[F_ASFK_FINALRECEIPTREGISTER.AMOUNT]",
              "code":"Measure",
              "caption":"Мера",
              "values":[
                {
                  "code":"F_ASFK_FINALRECEIPTREGISTER.AMOUNT",
                  "caption":"Фактически перечислено"
                }
              ]
            }
          ]
        },
        {
          "query":null,
          "relevance":2.2000666,
          "rawResponse":"bi-report:///8da7d6ed-e65a-4b60-80d9-0331c2301107/02.05.2018%2006.52.55.248?viewCode=gridOutcomesView",
          "data":[

          ],
          "labels":[
            "Территория"
          ],
          "parameters":[
            {
              "type":"resource",
              "key":"resource",
              "code":null,
              "caption":"Ресурс",
              "values":[
                {
                  "code":"PIAO_127_001_report_8da7d6ed-e65a-4b60-80d9-0331c2301107_gridOutcomesView",
                  "caption":"Исполнение консолидированных бюджетов субъектов Российской Федерации в разрезе кодов видов расходов (еженедельное обновление) (По видам расходов)"
                }
              ]
            },
            {
              "type":"dimension",
              "key":"[PIAO_127_001_report_8da7d6ed-e65a-4b60-80d9-0331c2301107_gridOutcomesView]",
              "code":"PIAO_127_001_report_8da7d6ed-e65a-4b60-80d9-0331c2301107_gridOutcomesView",
              "caption":"Исполнение консолидированных бюджетов субъектов Российской Федерации в разрезе кодов видов расходов (еженедельное обновление) (По видам расходов)",
              "values":[
                {
                  "code":"PIAO_127_UFKParam",
                  "caption":"Территория"
                }
              ]
            }
          ]
        },
        {
          "query":"{\"datamart\":[\"INDMBTNP\"],\"rows\":[{\"measure\":\"F_ASFK_MBTCBS.MBTSUM\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_FK_UFK.BUDGETCODE\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}",
          "relevance":2.2000108,
          "rawResponse":null,
          "data":[

          ],
          "labels":[
            "Сумма МБТ из ФБ по соглашению на текущий финансовый год",
            "Код субъекта РФ"
          ],
          "parameters":[
            {
              "type":"resource",
              "key":"resource",
              "code":null,
              "caption":"Ресурс",
              "values":[
                {
                  "code":"INDMBTNP",
                  "caption":"Операции КБС РФ и бюджетов ГВФ по использованию МБТ в целях реализации национальных проектов"
                }
              ]
            },
            {
              "type":"attribute",
              "key":"[INDMBTNP].[D_FK_UFK]",
              "code":"D_FK_UFK",
              "caption":"Субъект РФ",
              "values":[
                {
                  "code":"D_FK_UFK.BUDGETCODE",
                  "caption":"Код субъекта РФ"
                }
              ]
            },
            {
              "type":"measure",
              "key":"[INDMBTNP].[Measures].[F_ASFK_MBTCBS.MBTSUM]",
              "code":"Measure",
              "caption":"Мера",
              "values":[
                {
                  "code":"F_ASFK_MBTCBS.MBTSUM",
                  "caption":"Сумма МБТ из ФБ по соглашению на текущий финансовый год"
                }
              ]
            }
          ]
        },
        {
          "query":"{\"datamart\":[\"INDKVRNP\"],\"rows\":[{\"measure\":\"F_ASFK_EXKVRNP.BAU\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_FK_UFK.BUDGETCODE\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}",
          "relevance":2.2000914,
          "rawResponse":null,
          "data":[

          ],
          "labels":[
            "Роспись",
            "Код субъекта РФ"
          ],
          "parameters":[
            {
              "type":"attribute",
              "key":"[INDKVRNP].[D_FK_UFK]",
              "code":"D_FK_UFK",
              "caption":"Субъект РФ",
              "values":[
                {
                  "code":"D_FK_UFK.BUDGETCODE",
                  "caption":"Код субъекта РФ"
                }
              ]
            },
            {
              "type":"resource",
              "key":"resource",
              "code":null,
              "caption":"Ресурс",
              "values":[
                {
                  "code":"INDKVRNP",
                  "caption":"Информация об исполнении расходов всех уровней и кодов видов расходов на реализацию национальных (федеральных) проектов"
                }
              ]
            },
            {
              "type":"measure",
              "key":"[INDKVRNP].[Measures].[F_ASFK_EXKVRNP.BAU]",
              "code":"Measure",
              "caption":"Мера",
              "values":[
                {
                  "code":"F_ASFK_EXKVRNP.BAU",
                  "caption":"Роспись"
                }
              ]
            }
          ]
        },
        {
          "query":"{\"datamart\":[\"OMB\"],\"rows\":[{\"measure\":\"F_OMB_MBT.CASHFLOWBUDMEST\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_OMB_BUDGETS.BUDGNAMESUB\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}",
          "relevance":2.2000074,
          "rawResponse":null,
          "data":[

          ],
          "labels":[
            "Кассовый расход местных бюджетов",
            "Наименование бюджета субъекта"
          ],
          "parameters":[
            {
              "type":"resource",
              "key":"resource",
              "code":null,
              "caption":"Ресурс",
              "values":[
                {
                  "code":"OMB",
                  "caption":"Опись по операциям межбюджетных трансфертов"
                }
              ]
            },
            {
              "type":"attribute",
              "key":"[OMB].[D_OMB_BUDGETS]",
              "code":"D_OMB_BUDGETS",
              "caption":"Бюджет субъекта",
              "values":[
                {
                  "code":"D_OMB_BUDGETS.BUDGNAMESUB",
                  "caption":"Наименование бюджета субъекта"
                }
              ]
            },
            {
              "type":"measure",
              "key":"[OMB].[Measures].[F_OMB_MBT.CASHFLOWBUDMEST]",
              "code":"Measure",
              "caption":"Мера",
              "values":[
                {
                  "code":"F_OMB_MBT.CASHFLOWBUDMEST",
                  "caption":"Кассовый расход местных бюджетов"
                }
              ]
            }
          ]
        },
        {
          "query":null,
          "relevance":2.1999676,
          "rawResponse":"bi-report:///3a5fed4e-9103-441f-a9b6-d1bd984cd011/22.09.2020%2014.14.15.481?viewCode=Grid_FedLvl_Revenue_MAP",
          "data":[

          ],
          "labels":[
            "Карта"
          ],
          "parameters":[
            {
              "type":"resource",
              "key":"resource",
              "code":null,
              "caption":"Ресурс",
              "values":[
                {
                  "code":"PIAO_175_001_report_3a5fed4e-9103-441f-a9b6-d1bd984cd011_Grid_FedLvl_Revenue_MAP",
                  "caption":"Базовые и ключевые показатели исполнения бюджетов бюджетной системы РФ (Доходы - Карта)"
                }
              ]
            },
            {
              "type":"dimension",
              "key":"[PIAO_175_001_report_3a5fed4e-9103-441f-a9b6-d1bd984cd011_Grid_FedLvl_Revenue_MAP]",
              "code":"PIAO_175_001_report_3a5fed4e-9103-441f-a9b6-d1bd984cd011_Grid_FedLvl_Revenue_MAP",
              "caption":"Базовые и ключевые показатели исполнения бюджетов бюджетной системы РФ (Доходы - Карта)",
              "values":[
                {
                  "code":"territoryMap",
                  "caption":"Карта"
                }
              ]
            }
          ]
        },
        {
          "query":"{\"datamart\":[\"UIS\"],\"rows\":[{\"measure\":\"T_UIS_ALLPURCHTEMP.CONTRACTIMP2019\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_UIS_REGIONS_TEMP.NAME\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}",
          "relevance":2.2000082,
          "rawResponse":null,
          "data":[

          ],
          "labels":[
            "Сумма заключенных контрактов в 2019 году",
            "Наименование"
          ],
          "parameters":[
            {
              "type":"resource",
              "key":"resource",
              "code":null,
              "caption":"Ресурс",
              "values":[
                {
                  "code":"UIS",
                  "caption":"Данные выгруженные из ЕИС"
                }
              ]
            },
            {
              "type":"attribute",
              "key":"[UIS].[D_UIS_REGIONS_TEMP]",
              "code":"D_UIS_REGIONS_TEMP",
              "caption":"Субъекты РФ",
              "values":[
                {
                  "code":"D_UIS_REGIONS_TEMP.NAME",
                  "caption":"Наименование"
                }
              ]
            },
            {
              "type":"measure",
              "key":"[UIS].[Measures].[T_UIS_ALLPURCHTEMP.CONTRACTIMP2019]",
              "code":"Measure",
              "caption":"Мера",
              "values":[
                {
                  "code":"T_UIS_ALLPURCHTEMP.CONTRACTIMP2019",
                  "caption":"Сумма заключенных контрактов в 2019 году"
                }
              ]
            }
          ]
        },
        {
          "query":"{\"datamart\":[\"OBLIGATIONKBSMONTH0503128NP\"],\"rows\":[{\"measure\":\"F_BO_OBLIGATIONNP.APPROVBA\",\"agg\":\"SUM\"}],\"cols\":[{\"column\":\"D_BO_OKTMO.REGIONCODE\"}],\"calcs\":[],\"filters\":[],\"limit\":0,\"start\":0,\"total\":false,\"subTotal\":false,\"resultType\":\"TABULAR\",\"rowsCount\":false,\"showQuery\":false,\"timing\":false,\"noCache\":false}",
          "relevance":2.2000093,
          "rawResponse":null,
          "data":[

          ],
          "labels":[
            "Утверждено (доведено) бюджетных ассигнований",
            "Код субъекта"
          ],
          "parameters":[
            {
              "type":"resource",
              "key":"resource",
              "code":null,
              "caption":"Ресурс",
              "values":[
                {
                  "code":"OBLIGATIONKBSMONTH0503128NP",
                  "caption":"Отчет о бюджетных обязательствах (по национальным проектам) (форма по ОКУД 0503128-НП)"
                }
              ]
            },
            {
              "type":"attribute",
              "key":"[OBLIGATIONKBSMONTH0503128NP].[D_BO_OKTMO]",
              "code":"D_BO_OKTMO",
              "caption":"Субъект РФ, Территориальные фонды",
              "values":[
                {
                  "code":"D_BO_OKTMO.REGIONCODE",
                  "caption":"Код субъекта"
                }
              ]
            },
            {
              "type":"measure",
              "key":"[OBLIGATIONKBSMONTH0503128NP].[Measures].[F_BO_OBLIGATIONNP.APPROVBA]",
              "code":"Measure",
              "caption":"Мера",
              "values":[
                {
                  "code":"F_BO_OBLIGATIONNP.APPROVBA",
                  "caption":"Утверждено (доведено) бюджетных ассигнований"
                }
              ]
            }
          ]
        }
      ]
    }
  }
};