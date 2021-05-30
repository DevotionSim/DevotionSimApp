import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/RacingHistory/components/state.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';

class RacingHistoryScreen extends StatefulWidget {
  final QRList _qrList;

  RacingHistoryScreen(this._qrList);

  @override
  RacingHistoryScreenState createState() => RacingHistoryScreenState(_qrList);
}
