import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Circuits/circuits_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/components/body.dart';
import 'dart:ui';
import 'package:flutter_app_devotion_sim/Screens/Scan/scan_screen.dart';
import '../configuration_screen.dart';

class ConfigurationScreenState extends State<ConfigurationScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(
      children: <Widget>[
        AnimatedBackground(
          behaviour: RandomParticleBehaviour(options: particleOptions),
          vsync: this,
          child: Text(''),
        ),
        _titulo(),
        Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 130),
                  child: GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ScanScreen();
                            }));
                          },
                          child: Card(
                            color: Color.fromARGB(210, 255, 255, 255),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                      'assets/configuration/username.png'),
                                  Text(
                                    'CHANGE USERNAME',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'MotoGP',
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                            // bottomLeft
                                            offset: Offset(-1, -1),
                                            color: Colors.grey),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //Unimplemented
                          },
                          child: Card(
                            color: Color.fromARGB(210, 255, 255, 255),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                      'assets/configuration/userimage.png'),
                                  Text(
                                    'CHANGE USER IMAGE',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'MotoGP',
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                            // bottomLeft
                                            offset: Offset(-1, -1),
                                            color: Colors.grey),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CircuitsScreen();
                            }));
                          },
                          child: Card(
                            color: Color.fromARGB(210, 255, 255, 255),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                      'assets/configuration/emailuser.png'),
                                  Text(
                                    'CHANGE E-MAIL',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'MotoGP',
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                            // bottomLeft
                                            offset: Offset(-1, -1),
                                            color: Colors.grey),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //Unimplemented
                          },
                          child: Card(
                            color: Color.fromARGB(210, 255, 255, 255),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset('assets/configuration/lang.png'),
                                  Text(
                                    'CHANGE LANGUAGE',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'MotoGP',
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                            // bottomLeft
                                            offset: Offset(-1, -1),
                                            color: Colors.grey),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //unimplemented
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            //Unimplemented
                          },
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ],
    )));
  }
}

Widget _titulo() {
  return Container(
     margin: const EdgeInsets.only(top: 60, bottom: 30),
      width: double.infinity,
      child: Text('CONFIGURATION',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.redAccent,
            fontFamily: 'MotoGP',
            fontSize: 55,
            shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-2, -2),
                  color: Colors.white),
            ],
          )));
}
