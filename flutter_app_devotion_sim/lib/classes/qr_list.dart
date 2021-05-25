import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter_app_devotion_sim/classes/qr_code.dart';

class QRList {
  Map<int, QRCode> _qrList = Map<int, QRCode>();

  setQRList(Map<int, QRCode> map) {
    this._qrList = map;
  }

  Map<int, QRCode> getQRList() {
    return this._qrList;
  }

  QRCode getQR(int index) {
    return this._qrList.values.elementAt(index);
  }

  int? getIndexOf(QRCode code) {
    return this._qrList.keys.firstWhereOrNull((key) => _qrList[key]!.getQRCode() ==
        code.getQRCode());
  }

  addQR(QRCode code) {
    int count = this._qrList.length;
    this._qrList[count] = code;
  }

  delByQR(QRCode code) {
    this._qrList.removeWhere((key, value) => code.getQRCode() == value.getQRCode());
  }

  delByIndex(int index) {
    this._qrList.remove(index);
  }

  QRList();
}