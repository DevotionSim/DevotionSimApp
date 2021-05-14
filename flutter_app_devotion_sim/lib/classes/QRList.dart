import 'package:flutter_app_devotion_sim/classes/QRCode.dart';

class QRList {
  Map<int, QRCode> _qrList;

  setQRList(Map<int, QRCode> map) {
    this._qrList = map;
  }

  Map<int, QRCode> getQRList() {
    return this._qrList;
  }

  QRCode getQR(int index) {
    return this._qrList[index];
  }

  addQR(QRCode code) {
    int count = this._qrList.length;
    this._qrList.addAll( { count + 1: code } );
  }

  delByQR(QRCode code) {
    this._qrList.remove(code);
  }

  delByIndex(int index) {
    this._qrList.remove(index);
  }

  QRList(Map<int, QRCode> list) {
    this._qrList = list;
  }
}