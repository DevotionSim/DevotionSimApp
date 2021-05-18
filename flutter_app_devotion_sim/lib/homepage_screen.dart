import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/Screens/Circuits/circuits_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/dashboard_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Generate/components/generate.dart';
import 'package:flutter_app_devotion_sim/Screens/Scan/scan_screen.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Image.asset('assets/devlogo_original.png')),
            textButton("Scan QR Code", Scan()),
            textButton("Generate QR Code", Generate.instance),
            textButton("Statistics", CircuitsScreen()),
            textButton("Dashboard", DashboardScreen())
          ],
        ),
      ),
    );
  }

  Widget textButton(String text, Widget widget) {
    return TextButton(
        child: Text(text),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget));
        });
  }
}
