import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/components/body.dart';
import 'package:flutter_app_devotion_sim/classes/costumer.dart';

class DashboardScreen extends StatefulWidget {
  final Costumer _costumer;
  static const routeName = '/dashboard';

  DashboardScreen(this._costumer);

  @override
  Body createState() => Body(_costumer);
}
