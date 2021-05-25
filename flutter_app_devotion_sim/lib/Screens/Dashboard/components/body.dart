import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Circuits/circuits_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Generate/components/generate.dart';
import 'dart:ui';
import 'package:flutter_app_devotion_sim/Screens/Scan/scan_screen.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/dashboard/cabecera.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
            flex: 2,
            ),
            Expanded(
              child: Container(color: Color.fromARGB(255, 64, 64, 64)),
              flex: 5,
            ),
          ],
        ),
        Container(
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.only(left: 20, right: 20, top: 30),
                title: Text(
                  'DASHBOARD',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'MotoGP', fontSize: 40),
                ),
                subtitle: Text(
                  'Nombre Usuario',
                  style: TextStyle(color: Colors.black, fontFamily: 'MotoGP'),
                ),
                trailing: CircleAvatar(),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) {
                                  return ScanScreen();
                                })
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset('assets/dashboard/iconQR.png'),
                                  Text(
                                    'QR',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MotoGP',
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Unimplemented
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset('assets/dashboard/iconMultimedia.png'),
                                  Text(
                                    'Multimedia',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MotoGP',
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) {
                                  return CircuitsScreen();
                                })
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset('assets/dashboard/iconoStadistics.png'),
                                  Text(
                                    'Stadistics',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MotoGP',
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Unimplemented
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset('assets/dashboard/iconEvents.png'),
                                  Text(
                                    'Events',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MotoGP',
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Unimplemented
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset('assets/dashboard/iconoMap2.png'),
                                  Text(
                                    'My Races',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MotoGP',
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) {
                                  return Generate.instance!;
                                })
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset('assets/dashboard/iconSettings.png'),
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MotoGP',
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}