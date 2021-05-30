import 'package:flutter_app_devotion_sim/classes/stats.dart';

class StatsList {
  List<Stats>? _statsList;
  String? _codeId;
  String? _track;

  StatsList(this._statsList, this._codeId, this._track);

  StatsList.onlyTrack(this._track);

  setStatsList(List<Stats> statsList) {
    this._statsList = statsList;
  }

  List<Stats>? getStatsList() {
    return _statsList;
  }

  setCodeId(String id) {
    this._codeId = id;
  }

  String? getCodeId() {
    return this._codeId;
  }

  setTrack(String track) {
    this._track = track;
  }

  String? getTrack() {
    return _track;
  }
}