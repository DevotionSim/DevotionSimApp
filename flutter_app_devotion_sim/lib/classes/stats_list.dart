import 'package:flutter_app_devotion_sim/classes/stats.dart';

class StatsList {
  final String? codeId;
  final String? track;
  final String? lapTime;
  final String? dateTime;
  final List<Stats>? statsList;

  StatsList({
      required this.codeId,
      required this.track,
      required this.lapTime,
      required this.dateTime,
      required this.statsList});

  StatsList.empty(this.codeId, this.track, this.lapTime, this.dateTime, this.statsList);

  factory StatsList.fromJson(dynamic json) {
    var list = json['statsList'] as List;
    List<Stats> statsList = list.map((e) => Stats.fromJson(e)).toList();
    return StatsList(
      codeId: json['codeId'],
      track: json['track'],
      lapTime: json['lapTime'],
      dateTime: json['dateTime'],
      statsList: statsList,
    );
  }
}
