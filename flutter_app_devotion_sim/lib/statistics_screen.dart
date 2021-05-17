import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/classes/qr_code.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:qr_flutter/qr_flutter.dart';

class StatisticScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticScreen> {
  var screenSize;
  var width;
  var height;
  QRList qrList = QRList();

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < 21; i++) {
      qrList.addQR(QRCode("q10000111100000000000000000100010101011111100101000101000010011000001111q"));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Variables para controlar el tamaño de la pantalla
    screenSize = MediaQuery.of(context).size;
    width = screenSize.width;
    height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Column(children:[
        Container(
          height: 100,
          child: Center(
            child: Text("Racing History"),
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
              QrImage(
                data: qrList.getQR(index).getQRCode(),
                version: QrVersions.auto,
                size: 110,
                gapless: false,
                semanticsLabel: "DevotionSim QR",
              ),
          ),
        )
    );
  }
}
