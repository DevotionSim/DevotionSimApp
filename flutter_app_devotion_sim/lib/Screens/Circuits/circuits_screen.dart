import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Circuits/components/state.dart';
import 'package:flutter_app_devotion_sim/classes/costumer.dart';

class CircuitsScreen extends StatefulWidget {
  final Costumer _costumer;

  CircuitsScreen(this._costumer);

  @override
  CircuitScreenState createState() => CircuitScreenState(_costumer);
}
