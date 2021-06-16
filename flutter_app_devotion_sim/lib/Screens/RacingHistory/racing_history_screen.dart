import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/RacingHistory/components/state.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';

class RacingHistoryScreen extends StatefulWidget {
  final QRList _qrList;
  final String _trackKey;

  RacingHistoryScreen(this._qrList, this._trackKey);

  @override
  RacingHistoryScreenState createState() => RacingHistoryScreenState(_qrList, _trackKey);
}
