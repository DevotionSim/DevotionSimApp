import 'package:flutter_app_devotion_sim/classes/costumer_interface.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/classes/user.dart';

class Costumer extends User implements CostumerInterface{
  QRList? _qrList;

  Costumer(int id, String nickname, String email, QRList qrList) : super(id, nickname, email) {
    this._qrList = qrList;
  }

  setQRList(QRList list) {
    this._qrList = list;
  }

  QRList? getQRList() {
    return this._qrList;
  }

  @override
  bool changeEmail(String email) {
    // TODO: implement changeEmail
    throw UnimplementedError();
  }

  @override
  bool changeLanguage(String language) {
    // TODO: implement changeLanguage
    throw UnimplementedError();
  }

  @override
  bool changeNickname(String nickname) {
    // TODO: implement changeNickname
    throw UnimplementedError();
  }

  @override
  bool changeProfileImage() {
    // TODO: implement changeProfileImage
    throw UnimplementedError();
  }
}

