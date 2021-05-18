import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/Screens/RacingHistory/racing_history_screen.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import '../circuits_screen.dart';

class CircuitScreenState extends State<CircuitsScreen> {

  List<String> titles;
  List<Widget> images;

  @override
  void initState() {
    super.initState();

    titles = [
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

    images = [
      Container(
          color: Colors.red,
          child: Image.asset('assets/images/circuits/circuit_0.png')
      ),
      Container(
          color: Colors.yellow,
          child: Image.asset('assets/images/circuits/circuit_1.png')
      ),
      Container(
          color: Colors.cyan[200],
          child: Image.asset('assets/images/circuits/circuit_2.png')
      ),
      Container(
          color: Colors.deepPurpleAccent,
          child: Image.asset('assets/images/circuits/circuit_3.png')
      ),
      Container(
          color: Colors.orange,
          child: Image.asset('assets/images/circuits/circuit_4.png')
      ),
      Container(
          color: Colors.purpleAccent,
          child: Image.asset('assets/images/circuits/circuit_5.png')
      ),
      Container(
          color: Colors.cyan,
          child: Image.asset('assets/images/circuits/circuit_6.png')
      ),
      Container(
          color: Colors.grey,
          child: Image.asset('assets/images/circuits/circuit_7.png')
      ),
      Container(
          color: Colors.pink,
          child: Image.asset('assets/images/circuits/circuit_8.png')
      ),
      Container(
          color: Colors.amberAccent,
          child: Image.asset('assets/images/circuits/circuit_9.png')
      ),
      Container(
          color: Colors.deepOrange,
          child: Image.asset('assets/images/circuits/circuit_10.png')
      ),
      Container(
          color: Colors.indigo,
          child: Image.asset('assets/images/circuits/circuit_11.png')
      ),
      Container(
          color: Colors.blue,
          child: Image.asset('assets/images/circuits/circuit_12.png')
      ),
      Container(
          color: Colors.grey[300],
          child: Image.asset('assets/images/circuits/circuit_13.png')
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  textStyle: TextStyle(
                    fontFamily:'MotoGP',
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {},
                  align: ALIGN.CENTER,
                  onSelectedItem: (index) {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) {
                          return RacingHistoryScreen();
                        })
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}