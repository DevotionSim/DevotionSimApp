import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/Screens/RacingHistory/racing_history_screen.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import '../circuits_screen.dart';

class CircuitScreenState extends State<CircuitsScreen> {

  late List<String> titles;
  late List<Widget> images;

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
              child: VerticalCardPager(
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
      )
    );
  }
}