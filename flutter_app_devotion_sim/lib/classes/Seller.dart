import 'package:flutter_app_devotion_sim/classes/QRList.dart';
import 'package:flutter_app_devotion_sim/classes/SellerInterface.dart';
import 'package:flutter_app_devotion_sim/classes/User.dart';

class Seller extends User implements SellerInterface {
  Seller(int id, String nickname, String email, QRList list) : super(id, nickname, email, list);

  @override
  int checkSales() {
    // TODO: implement checkSales
    throw UnimplementedError();
  }

  @override
  bool generateCode() {
    // TODO: implement generateCode
    throw UnimplementedError();
  }

  @override
  bool uploadQRList(QRList list) {
    // TODO: implement uploadQRList
    throw UnimplementedError();
  }
}