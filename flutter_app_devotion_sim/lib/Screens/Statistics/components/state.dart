import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/classes/stats_list.dart';
import 'package:flutter_app_devotion_sim/utils/utils.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import '../statistics_screen.dart';

class StatisticsScreenState extends State<StatisticsScreen> {

  StatsList _statsList;
  List<String> time;
  List<int> gas, speed, gear, lean, fBrake, rBrake;

  Future<void> loadList() async {
    _statsList = StatsList(await jsonStats('assets/stats.json'));

    for(int i = 0; i < _statsList.statsList.length; i++) {
      time.add(_statsList.statsList[i].time);
      gas.add(_statsList.statsList[i].gas);
      speed.add(_statsList.statsList[i].speed);
      gear.add(_statsList.statsList[i].gear);
      lean.add(_statsList.statsList[i].lean);
      fBrake.add(_statsList.statsList[i].frontBrake);
      rBrake.add(_statsList.statsList[i].rearBrake);
    }
  }

  @override
  void initState() {
    super.initState();
    loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                child: TextButton(
                  onPressed: () {
                      print(_statsList.statsList[5].frontBrake);
                  },
                  child: Text("Click")),
              ),
              Container(
                height: 500,
                width: 420,
                child: Echarts(
                  option: '''
                  {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                          type: 'line'          //shadow or line
                        }
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataZoom: {
                                yAxisIndex: 'none'
                            },
                            restore: {}
                        }
                    },
                    legend: {
                        width: '75%',
                        left: '3%',
                        data: ['Rear Brake', 'Front Brake', 'Lean', 'Gas', 'Speed', 'Gear']
                    },
                    grid: {
                        left: '3%',
                        right: '6%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        name: 'Time Line',
                        nameLocation: 'middle',
                        type: 'category',
                        boundaryGap: false,
                        data: ['0:01','0:02','0:03','0:04','0:05','0:06','0:07']
                    },
                    yAxis: {
                        name: 'Stats',
                        nameLocation: 'middle',
                        type: 'value'
                    },
                    dataZoom: [{
                        type: 'inside',
                        start: 0,
                        end: 100
                    }, {
                        start: 0,
                        end: 100,
                        top: 'ph'
                    }],
                    series: [
                        {
                            name: 'Rear Brake',
                            type: 'line',
                            emphasis: {
                                focus: 'series'
                            },
                            data: [120, 132, 101, 134, 90, 230, 210]
                        },
                        {
                            name: 'Front Brake',
                            type: 'line',
                            emphasis: {
                                focus: 'series'
                            },
                            data: [220, 182, 191, 234, 290, 330, 310]
                        },
                        {
                            name: 'Lean',
                            type: 'line',
                            emphasis: {
                                focus: 'series'
                            },
                            data: [150, 232, 201, 154, 190, 330, 410]
                        },
                        {
                            name: 'Gas',
                            type: 'line',
                            emphasis: {
                                focus: 'series'
                            },
                            data: [320, 332, 301, 334, 390, 330, 320]
                        },
                        {
                            name: 'Speed',
                            type: 'line',
                            emphasis: {
                                focus: 'series'
                            },
                            data: [820, 932, 901, 934, 903, 950, 890]
                        },
                        {
                            name: 'Gear',
                            type: 'line',
                            emphasis: {
                                focus: 'series'
                            },
                            data: [100, 200, 400, 500, 600, 300, 200]
                        }
                    ]
                  }
                ''',
                ),
              ),
            ],
          ),
        )
    );
  }
}



/* Código para importar datos desde json en javascript

import * as echarts from 'echarts';

var ROOT_PATH = 'https://echarts.apache.org/examples';

var chartDom = document.getElementById('main');
var myChart = echarts.init(chartDom);
var option;

$.get(ROOT_PATH + '/data/asset/data/life-expectancy-table.json', function (_rawData) {
    run(_rawData);
});

function run(_rawData) {

    option = {
        dataset: [{
            id: 'dataset_raw',
            source: _rawData
        }, {
            id: 'dataset_since_1950_of_germany',
            fromDatasetId: 'dataset_raw',
            transform: {
                type: 'filter',
                config: {
                    and: [
                        { dimension: 'Year', gte: 1950 },
                        { dimension: 'Country', '=': 'Germany' }
                    ]
                }
            }
        }, {
            id: 'dataset_since_1950_of_france',
            fromDatasetId: 'dataset_raw',
            transform: {
                type: 'filter',
                config: {
                    and: [
                        { dimension: 'Year', gte: 1950 },
                        { dimension: 'Country', '=': 'France' }
                    ]
                }
            }
        }],
        title: {
            text: 'Income of Germany and France since 1950'
        },
        tooltip: {
            trigger: 'axis'
        },
        xAxis: {
            type: 'category',
            nameLocation: 'middle'
        },
        yAxis: {
            name: 'Income'
        },
        series: [{
            type: 'line',
            datasetId: 'dataset_since_1950_of_germany',
            showSymbol: false,
            encode: {
                x: 'Year',
                y: 'Income',
                itemName: 'Year',
                tooltip: ['Income'],
            }
        }, {
            type: 'line',
            datasetId: 'dataset_since_1950_of_france',
            showSymbol: false,
            encode: {
                x: 'Year',
                y: 'Income',
                itemName: 'Year',
                tooltip: ['Income'],
            }
        }]
    };

    myChart.setOption(option);

}

option && myChart.setOption(option);

 */
