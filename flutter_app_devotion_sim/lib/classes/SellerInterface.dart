import 'package:flutter_app_devotion_sim/classes/QRList.dart';

abstract class SellerInterface {
  bool generateCode();
  int checkSales();
  bool uploadQRList(QRList list);
}