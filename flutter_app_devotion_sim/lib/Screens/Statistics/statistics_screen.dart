import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Statistics/components/state.dart';
import 'package:flutter_app_devotion_sim/classes/qr_code.dart';

class StatisticsScreen extends StatefulWidget {
  final QRCode _qrCode;

  StatisticsScreen(this._qrCode);

  @override
  StatisticsScreenState createState() => StatisticsScreenState(_qrCode);
}