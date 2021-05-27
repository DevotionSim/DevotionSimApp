import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/classes/seller_interface.dart';
import 'package:flutter_app_devotion_sim/classes/user.dart';

class Seller extends User implements SellerInterface {
  QRList? _qrList;

  Seller(int id, String nickname, String email, QRList list) : super(id, nickname, email) {
    this._qrList = list;
  }

  setQRList(QRList list) {
    this._qrList = list;
  }

  QRList? getQRList() {
    return this._qrList;
  }

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