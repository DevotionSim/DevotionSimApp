import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Statistics/components/state.dart';
import 'package:flutter_app_devotion_sim/classes/stats_list.dart';

class StatisticsScreen extends StatefulWidget {
  final StatsList _statsList;

  StatisticsScreen(this._statsList);

  @override
  StatisticsScreenState createState() => StatisticsScreenState(_statsList);
}