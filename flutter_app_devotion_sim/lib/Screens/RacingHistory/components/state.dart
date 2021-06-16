import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/Screens/Statistics/statistics_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../racing_history_screen.dart';

class RacingHistoryScreenState extends State<RacingHistoryScreen> {

  QRList _qrList;
  String _trackKey;
  late var screenSize;
  var width;
  var height;

  RacingHistoryScreenState(this._qrList, this._trackKey);

  @override
  Widget build(BuildContext context) {
    // Variables para controlar el tamaño de la pantalla
    screenSize = MediaQuery.of(context).size;
    width = screenSize.width;
    height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children:[
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Center(
            child: Text('Racing History',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.redAccent,
                fontFamily: 'MotoGP',
                fontSize: 50,
                shadows: [
                  Shadow(
                    // bottomLeft
                    offset: Offset(-2, -2),
                    color: Colors.black
                  ),
                ],
              )
            )
          ),
        ),
        Container(
          width: width * 0.7,
          child: Divider(
            color: Colors.orange,
          ),
        ),
        Container(
          child: Divider(
            height: 30,
            color: Colors.transparent,
          ),
        ),
        _body()
      ])
    );
  }

  double resizeList() {
    double deviceHeight = height * 0.698;
    if(_qrList.getQRList().length * 64 < deviceHeight) {
      return _qrList.getQRList().length * 64;
    }
    else {
      return deviceHeight;
    }
  }

  Widget _body() {
    return Container(
      height: height * 0.8,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: width * 0.8,
              height: 80 + _qrList.getQRList().length * 64,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(120, 80),
                  topRight: Radius.elliptical(120, 80),
                  bottomLeft: Radius.elliptical(100, 16),
                  bottomRight: Radius.elliptical(100, 16)
                )
              ),
            )
          ),
          Positioned(
            top: 6,
            child: Container(
              width: width * 0.8,
              height: 80,
              child: Text(_trackKey,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'MotoGP',
                  fontSize: 38,
                  shadows: [
                    Shadow(
                      // bottomLeft
                      offset: Offset(-2, -2),
                      color: Colors.black
                    ),
                  ],
                )
              ),
            )
          ),
          Positioned(
            top: 68,
            child: Container(
              width: width * 0.8,
              height: resizeList(),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Container(
                child: ListView.builder(
                  itemExtent: 64,
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  itemCount: _qrList.getQRList().length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) {
                          return StatisticsScreen(_qrList.getQR(index));
                        })
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black87,
                          child: Row(
                            children: [
                              Card(
                                child: QrImage(
                                  data: _qrList.getQR(index).getQRCode(),
                                  version: QrVersions.auto,
                                  size: 54,
                                  gapless: false,
                                  semanticsLabel: "DevotionSim QR",
                                ),
                              ),
                              Expanded(
                                child: Text(_qrList.getQR(index).getStatsList().date! + "\n" +
                                  _qrList.getQR(index).getStatsList().lapTime.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MotoGP',
                                    fontSize: 18,
                                    shadows: [
                                      Shadow(
                                        // bottomLeft
                                        offset: Offset(1, 1),
                                        color: Colors.grey
                                      ),
                                    ],
                                  )
                                )
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}