import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/Screens/RacingHistory/racing_history_screen.dart';
import 'package:flutter_app_devotion_sim/classes/costumer.dart';
import 'package:flutter_app_devotion_sim/classes/qr_code.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/database/database.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import '../circuits_screen.dart';

class CircuitScreenState extends State<CircuitsScreen> {
  late Future<void> _qrListCall;
  late List<String> _titles;
  late List<Widget> _images;
  late Map<String, Widget> _costumerCircuits;
  late QRList _qrList = QRList();
  late Map<int, QRCode> _mapQR;
  Costumer _costumer;

  Future<void> getQRListFromDB() async {
    _qrList = await selectQrList(_costumer.getUserId());
  }

  Future<bool> _callQRList() async {
    _costumerCircuits = Map<String, Widget>();
    await Future.wait([getQRListFromDB()]).whenComplete(() => _mapQR = _qrList.getQRList());
    for(int i = 0; i < _mapQR.length; i++) {

      if(_mapQR.values.elementAt(i).getStatsList().track != null) {
        String track = _mapQR.values.elementAt(i).getStatsList().track!;

        for(int j = 0; j < _titles.length; j++) {

          if(track == _titles[j] && !_costumerCircuits.keys.contains(track)) {
            _costumerCircuits[track] = _images[j];
          }
        }
      }
    }
    return true;
  }

  CircuitScreenState(this._costumer);

  @override
  void initState() {
    _qrListCall = _callQRList();
    super.initState();

    _titles = [
      "Mugello",
      "Catalunya",
      "Sachsenring",
      "Assen",
      "KymiRing",
      "Red Bull Ring",
      "Silverstone",
      "Motorland",
      "Misano",
      "Motegi",
      "Chang",
      "Phillip Island",
      "Sepang",
      "Ricardo Tormo"
    ];

    _images = [
      Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_0.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_1.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.cyan[200],
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_2.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_3.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_4.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_5.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_6.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_7.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_8.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_9.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_10.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_11.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_12.png')
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/circuits/circuit_13.png')
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 32),
            width: double.infinity,
            child: Text('CIRCUITS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.redAccent,
                fontFamily: 'MotoGP',
                fontSize: 60,
                shadows: [
                  Shadow(
                    // bottomLeft
                    offset: Offset(-2, -2),
                    color: Colors.white),
                ],
              )
            )
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: _qrListCall,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return _buildProgressIndicator();
                  }
                  else if (snapshot.hasError) {
                    print(snapshot.error);
                    return _buildError();
                  }
                  else {
                    return _buildBody();
                  }
                },
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget goRacingHistory(Map<int, QRCode> mapOrig, Map<String, Widget> mapWidget, int circuit) {
    String track = mapWidget.keys.elementAt(circuit);
    QRList qrListCircuit = QRList();
    qrListCircuit.getQRList().addEntries(mapOrig.entries.where((element) =>
      element.value.getStatsList().track! == track));
    return RacingHistoryScreen(qrListCircuit);
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: Container(
          width: 300, height: 300, child: CircularProgressIndicator()),
    );
  }

  Widget _buildError() {
    return Center(
      child: Container(
          width: 300,
          height: 100,
          child: Text("Error while loading QRList")),
    );
  }

  Widget _buildBody() {
    return VerticalCardPager(
      textStyle: TextStyle(
        fontFamily:'MotoGP',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            // bottomLeft
              offset: Offset(-2, -2),
              color: Colors.black),
        ],
      ),
      titles: _costumerCircuits.keys.toList(),
      images: _costumerCircuits.values.toList(),
      align: ALIGN.CENTER,
      onSelectedItem: (index) {
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) {
            return goRacingHistory(_qrList.getQRList(), _costumerCircuits, index);
          })
        );
      },
    );
  }
}