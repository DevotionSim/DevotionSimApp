import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/components/body_seller.dart';
import 'package:flutter_app_devotion_sim/classes/seller.dart';

class DashboardScreenSeller extends StatefulWidget {
  final Seller _seller;

  DashboardScreenSeller(this._seller);

  @override
  Body createState() => Body(_seller);
}
