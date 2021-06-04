import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/classes/qr_code.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../statistics_screen.dart';

class StatisticsScreenState extends State<StatisticsScreen> {
  late Future<void> _jsonCall;
  QRCode _qrCode;
  late List<String?> _time;
  late List<int?> _gas, _speed, _gear, _lean, _fBrake, _rBrake;

  StatisticsScreenState(this._qrCode);

  Future<void> loadList() async {

  }

  @override
  void initState() {
    _time = [];
    _gas = [];
    _speed = [];
    _gear = [];
    _lean = [];
    _fBrake = [];
    _rBrake = [];

    for (int i = 0; i < _qrCode.getStatsList().statsList!.length; i++) {
      _time.add(_qrCode.getStatsList().statsList![i].time);
      _gas.add(_qrCode.getStatsList().statsList![i].gas);
      _speed.add(_qrCode.getStatsList().statsList![i].speed);
      _gear.add(_qrCode.getStatsList().statsList![i].gear);
      _lean.add(_qrCode.getStatsList().statsList![i].lean);
      _fBrake.add(_qrCode.getStatsList().statsList![i].frontBrake);
      _rBrake.add(_qrCode.getStatsList().statsList![i].rearBrake);
    }

    _jsonCall = _callJsonStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 50, bottom: 30),
              alignment: Alignment.center,
              child: Text('Racing Telemetry',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'MotoGP',
                    fontSize: 46,
                    shadows: [
                      Shadow(
                          // bottomLeft
                          offset: Offset(-2, -2),
                          color: Colors.black),
                    ],
                  ))),
          FutureBuilder(
            future: _jsonCall,
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.connectionState == ConnectionState.waiting)
                return _buildProgressIndicator();
              else if (snapshot.hasError)
                return _buildError();
              else
                return _buildBody();
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _callJsonStats() async {
    await Future.wait([loadList()]);
    return true;
  }

  Widget echarts() {
    return Echarts(
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
            data: ${jsonEncode(_time)}
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
                data: ${jsonEncode(_rBrake)}
            },
            {
                name: 'Front Brake',
                type: 'line',
                emphasis: {
                    focus: 'series'
                },
                data: ${jsonEncode(_fBrake)}
            },
            {
                name: 'Lean',
                type: 'line',
                emphasis: {
                    focus: 'series'
                },
                data: ${jsonEncode(_lean)}
            },
            {
                name: 'Gas',
                type: 'line',
                emphasis: {
                    focus: 'series'
                },
                data: ${jsonEncode(_gas)}
            },
            {
                name: 'Speed',
                type: 'line',
                emphasis: {
                    focus: 'series'
                },
                data: ${jsonEncode(_speed)}
            },
            {
                name: 'Gear',
                type: 'line',
                emphasis: {
                    focus: 'series'
                },
                data: ${jsonEncode(_gear)}
            }
        ]
      }
    ''',
    );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: Container(
          width: 300, height: 300, child: CircularProgressIndicator()),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 500,
            width: 420,
            child: echarts(),
          ),
          Divider(
            height: 30,
          ),
          Card(
            child: QrImage(
              data: _qrCode.getQRCode(),
              version: QrVersions.auto,
              size: 120,
              gapless: false,
              semanticsLabel: "DevotionSim QR",
            ),
          )
        ],
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Container(
          width: 300,
          height: 100,
          child: Text("Error while loading Web Services")),
    );
  }
}
