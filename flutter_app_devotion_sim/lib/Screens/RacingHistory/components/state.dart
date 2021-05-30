import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/Screens/Statistics/statistics_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../racing_history_screen.dart';

class RacingHistoryScreenState extends State<RacingHistoryScreen> {

  QRList qrList;

  RacingHistoryScreenState(this.qrList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        color: Colors.white),
                  ],
                )
              )
            ),
          ),
          Expanded(
            child: _contentGridView(),
          ),
        ])
    );
  }

  Widget _contentGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: qrList.getQRList().length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
        itemBuilder: (context, index) => Container(
          child: Card(
            child:
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) {
                      return StatisticsScreen(qrList.getQR(index).getStatsList());
                    })
                );
              },
              child: QrImage(
                data: qrList.getQR(index).getQRCode(),
                version: QrVersions.auto,
                size: 110,
                gapless: false,
                semanticsLabel: "DevotionSim QR",
              ),
            ),
          ),
        )
    );
  }
}