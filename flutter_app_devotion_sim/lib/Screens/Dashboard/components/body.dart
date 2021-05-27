import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Circuits/circuits_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Configuration/configuration_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Events/eventos_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Gallery/gallery_chooser_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Generate/components/generate.dart';
import 'dart:ui';
import 'package:flutter_app_devotion_sim/Screens/Scan/scan_screen.dart';
import '../dashboard_screen.dart';

class Body extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                    image: DecorationImage(
                        image: AssetImage("assets/dashboard/cabecera.png"),
                        fit: BoxFit.cover)),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(color: Color.fromARGB(255, 61, 61, 61)),
              flex: 5,
            ),
          ],
        ),
        AnimatedBackground(
          behaviour: RandomParticleBehaviour(options: particleOptions),
          vsync: this,
          child: Text(''),
        ),
        Container(
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.only(left: 20, right: 20, top: 30),
                title: Text(
                  'DASHBOARD',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'MotoGP',
                    fontSize: 50,
                    shadows: [
                      Shadow(
                          // bottomLeft
                          offset: Offset(-2, -2),
                          color: Colors.black),
                    ],
                  ),
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ScanScreen();
                            }));
                          },
                          child: Card(
                            color: Color.fromARGB(220, 255, 255, 255),
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
                              return GalleryChooserScreen();
                            }));
                          },
                          child: Card(
                            color: Color.fromARGB(220, 255, 255, 255),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                      'assets/dashboard/iconMultimedia.png'),
                                  Text(
                                    'Multimedia',
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
                            color: Color.fromARGB(220, 255, 255, 255),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                      'assets/dashboard/iconoStadistics.png'),
                                  Text(
                                    'Stadistics',
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
                              return EventosScreen();
                            }));
                          },
                          child: Card(
                            color: Color.fromARGB(220, 255, 255, 255),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                      'assets/dashboard/iconEvents.png'),
                                  Text(
                                    'Events',
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
                                  return Generate.instance!;
                                }));
                          },
                          child: Card(
                            color: Color.fromARGB(220, 255, 255, 255),
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
                              return ConfigurationScreen();
                            }));
                          },
                          child: Card(
                            color: Color.fromARGB(220, 255, 255, 255),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                      'assets/dashboard/iconSettings.png'),
                                  Text(
                                    'Settings',
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

ParticleOptions particleOptions = ParticleOptions(
  baseColor: Colors.redAccent,
  spawnOpacity: 0.0,
  opacityChangeRate: 0.25,
  minOpacity: 0.1,
  maxOpacity: 0.4,
  spawnMinSpeed: 60.0,
  spawnMaxSpeed: 110.0,
  spawnMinRadius: 7.0,
  spawnMaxRadius: 25.0,
  particleCount: 50,
);
