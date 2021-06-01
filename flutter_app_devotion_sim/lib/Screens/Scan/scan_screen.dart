import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Scan/components/state.dart';
import 'package:flutter_app_devotion_sim/classes/costumer.dart';

class ScanScreen extends StatefulWidget {
  final Costumer _costumer;

  ScanScreen(this._costumer);

  @override
  ScanScreenState createState() => ScanScreenState(this._costumer);
}

