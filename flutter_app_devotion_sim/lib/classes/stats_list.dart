import 'package:flutter_app_devotion_sim/classes/stats.dart';

class StatsList {
  final List<Stats>? statsList;
  String _codeId;

  StatsList(this.statsList, this._codeId);

  setCodeId(String id) {
    this._codeId = id;
  }

  String getCodeId() {
    return this._codeId;
  }
}