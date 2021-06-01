import 'package:flutter_app_devotion_sim/classes/stats_list.dart';

class QRCode {
  int _qrId = 0;
  String _qrCode = "";
  bool _disabled = false;
  static int _codeCount = 0;
  late StatsList? _statsList;

  setQRId(int id) {
    this._qrId = id;
  }

  int getQRId() {
    return this._qrId;
  }

  setQRCode(String code) {
    this._qrCode = code;
  }

  String getQRCode() {
    return this._qrCode;
  }

  setDisabled(bool disabled) {
    this._disabled = disabled;
  }

  bool isDisabled() {
    return this._disabled;
  }

  setCodeCount(int count) {
    _codeCount = count;
  }

  int getCodeCount() {
    return _codeCount;
  }

  setStatsList(StatsList list) {
    this._statsList = list;
  }

  StatsList getStatsList() {
    return this._statsList!;
  }

  QRCode(String code) {
    this._qrCode = code;
    this._qrId = _codeCount;
    _codeCount++;
  }

  QRCode.withStats(String code, StatsList? statsList) {
    this._qrCode = code;
    this._statsList = statsList;
    _codeCount++;
  }
}