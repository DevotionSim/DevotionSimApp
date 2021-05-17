import 'package:flutter_app_devotion_sim/classes/qr_list.dart';

abstract class SellerInterface {
  bool generateCode();
  int checkSales();
  bool uploadQRList(QRList list);
}