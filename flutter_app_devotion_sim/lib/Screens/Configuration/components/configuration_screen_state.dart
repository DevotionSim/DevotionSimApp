import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Configuration/change_gmail_screen%20.dart';
import 'package:flutter_app_devotion_sim/Screens/Configuration/change_username_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/components/body.dart';
import 'package:flutter_app_devotion_sim/Screens/Login/login_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Login/transition_route_observer.dart';
import 'dart:ui';
import '../configuration_screen.dart';

class ConfigurationScreenState extends State<ConfigurationScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

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
                  color: Color.fromARGB(255, 61, 61, 61),
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
                            return changeUsernameScreen();
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
                            return changeEmailScreen();
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreen();
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
                                    'assets/configuration/logout.png'),
                                Text(
                                  'LOG OUT',
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
