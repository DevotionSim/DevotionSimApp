import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Circuits/components/state.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';

class CircuitsScreen extends StatefulWidget {

  final QRList _qrList;

  CircuitsScreen(this._qrList);

  @override
  CircuitScreenState createState() => CircuitScreenState(_qrList);
}
